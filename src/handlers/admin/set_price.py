from aiogram import types
from aiogram.dispatcher import FSMContext

import product_storage
from src.handlers.admin import AdminStates
from src.handlers.admin.storage_history import SetPriceStates
from src.handlers.roles import IsAdmin
from pkg import dp, get_keyboard, get_most_similar_strings


@dp.message_handler(IsAdmin(), lambda message: message.text == "set price", state=AdminStates.INITIAL_STATE)
async def set_price(message: types.Message, state: FSMContext):
    await SetPriceStates.WAITING_PRODUCT_NAME.set()
    products = product_storage.get_products()
    products_without_price = [product for product in products if not product.price]
    keyboard = get_keyboard([pr.name for pr in products_without_price])
    await message.answer(f"Введите часть имени продукта", reply_markup=keyboard)


@dp.message_handler(IsAdmin(), state=SetPriceStates.WAITING_PRODUCT_NAME)
async def set_price_chose_product(message: types.Message, state: FSMContext):
    product_name = message.text
    products = product_storage.get_products()
    product_names = [p.name for p in products]
    similar_product_names = get_most_similar_strings(product_name, product_names)[:10]
    keyboard = get_keyboard(similar_product_names)
    await SetPriceStates.WAITING_PRODUCT_NAME_2.set()
    await message.answer(f"Выберите продукт", reply_markup=keyboard)


@dp.message_handler(IsAdmin(), state=SetPriceStates.WAITING_PRODUCT_NAME_2)
async def set_price_chose_product_final(message: types.Message, state: FSMContext):
    product_name = message.text
    product = product_storage.get_product_by_name(product_name)
    if not product:
        return await message.answer(f"Нет такого продукта")
    await state.update_data({"SET_PRICE_PRODUCT": product})
    await SetPriceStates.WAITING_NEW_PRICE.set()
    await message.answer(f"Встречающиеся цены продукта {product.prices}\nДобавьте новые встречающиеся цены через запятую")


SET_PRICE_VARIABLES = ["SET_PRICE_PRODUCT"]
