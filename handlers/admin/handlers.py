import re

import aiogram.types
#import product_storage
from aiogram import types
from aiogram.dispatcher import FSMContext
from aiogram.dispatcher.filters.state import StatesGroup, State
from aiogram.types import KeyboardButton, ReplyKeyboardMarkup

import product_storage
from users import get_user_by_id
import categories as categories_module
import expenses
import messages
import money
#import poster_storage as ps
from handlers.roles import IsAdmin
from pkg import dp, get_dates_from_string


class UserStates(StatesGroup):
    WAITING_FOR_FIRST_RESPONSE = State()
    WAITING_FOR_SECOND_RESPONSE = State()


@dp.message_handler(commands=['start', 'help'])
async def send_welcome(message: types.Message):
    """Отправляет приветственное сообщение и помощь по боту"""
    keyboard = aiogram.types.ReplyKeyboardMarkup(resize_keyboard=True)
    buttons = [KeyboardButton(text="Button 1"), KeyboardButton(text="Button 2")]
    keyboard.add(*buttons)

    await message.answer(
        "Бот для учёта финансов\n\n"
        "Добавить расход: 250 такси 300 яблоки (и тд)"
        "Сегодняшняя статистика: /today\n"
        "За текущий месяц: /month\n"
        "Последние внесённые расходы: /expenses\n"
        "Категории трат: /categories")

#
# @dp.message_handler(commands=['change_role'])
# async def change_role(message: types.Message):
#     markup = ReplyKeyboardMarkup(selective=True)
#     markup.add(expenses_)
#     markup.add(shipments_, other)
#
#     await message.answer('Меню', reply_markup=markup)
#
#
# @dp.message_handler(text=expenses_)
# async def process_expenses_chose_role(message: types.Message):
#     await message.answer('Вы выбрали траты')
#
#
# @dp.message_handler(text=shipments_)
# async def process_shipments_chose_role(message: types.Message):
#     await message.answer('Вы выбрали поставки')


# @dp.message_handler(text=other)
# async def process_other_chose_role(message: types.Message):
#     await message.answer('Вы выбрали другое')


@dp.message_handler(commands=['today'])
async def today_statistics(message: types.Message):
    """Отправляет сегодняшнюю статистику трат"""
    exp_list = expenses.get_today_expenses()
    answer_message = expenses.print_expenses(exp_list, "сегодня")
    await message.answer(answer_message)


@dp.message_handler(commands=['expenses'])
async def date_statistics(message: types.Message):
    """Отправляет сегодняшнюю статистику трат"""
    text = message.get_args()
    dates = get_dates_from_string(text)
    if not dates:
        return
    date = dates[0]
    date_string = date.strftime("%d-%m-%Y")
    exp_list = expenses.get_expenses_by_date(date_string)
    answer_message = expenses.print_expenses(exp_list, date_string)
    await message.answer(answer_message)


@dp.message_handler(commands=['storage'])
async def storage(message: types.Message):
    """Отправляет сегодняшнюю статистику трат"""
    products = product_storage.get_products_in_storage()
    products = [product for product in products if product.quantity]
    answer_string = "Склад:"
    for product_volume in products:
        product = product_storage.get_product_by_id(product_volume.product_id)
        answer_string += "\n" + f"{product.name}: {product_volume.quantity} {product.measurement_unit}"
    await message.answer(answer_string)


@dp.message_handler(commands=['storage_history'])
async def storage(message: types.Message):
    """Отправляет сегодняшнюю статистику трат"""
    changes = product_storage.get_product_changes()
    answer_string = ""
    for date in changes:
        answer_string += date
        for user_id in changes[date]:
            user = get_user_by_id(user_id)
            answer_string += f"\n{user.name}:" + product_storage.volumes_string(changes[date][user_id]) + "\n"
    await message.answer(answer_string)


@dp.message_handler(commands=['month'])
async def month_statistics(message: types.Message):
    """Отправляет статистику трат текущего месяца"""
    exp_list = expenses.get_month_expenses()
    answer_message = expenses.print_expenses(exp_list, "в этом месяце")
    await message.answer(answer_message)


@dp.message_handler(IsAdmin(), commands=['oa'])
async def other_aliases(message: types.Message):
    unnamed = categories_module.name_aliases_by_name()[categories_module.UNNAMED_PRODUCT_NAME]
    result_message = unnamed.aliases
    await message.answer(", ".join(result_message))


@dp.message_handler(IsAdmin(), commands=['transfer'])
async def transfer_money(message: types.Message):
    text = message.text
    try:
        amount = re.search("\d+", text).group()
        from_user = re.search("(?<=\d\s)\S+(?=\s->)", text).group()
        to_user = re.search("(?<=->\s)\S+", text).group()
    except Exception:
        await message.answer("Неправильный формат. Сообщение должно быть /transfer 200 Никита -> Мириан\n"
                             "Доступные пользователи: Мириан, Никита, Касса, Счет")
        return

    money.transfer(float(amount), from_user, to_user)
    await message.answer(f"Успешно перевел {amount} от {from_user} к {to_user}")


# @dp.message_handler(IsAdmin(), commands=['storage'])
# async def storage(message: types.Message):
#     answer = await ps.quantity_report()
#     await message.answer(f"{answer}")


@dp.message_handler(IsAdmin(), commands=['balance'])
async def balance(message: types.Message):
    await message.answer(money.balance_report())


@dp.message_handler(IsAdmin(), commands=['ro'])
async def restructure_other(message: types.Message):
    unnamed = categories_module.name_aliases_by_name()[categories_module.UNNAMED_PRODUCT_NAME]
    aliases = unnamed.aliases
    keyboard = ReplyKeyboardMarkup(selective=True)
    buttons = [KeyboardButton(text=alias) for alias in aliases]
    keyboard.add(*buttons)
    await message.answer(f"Какому алиасу вы хотите назначить имя?", reply_markup=keyboard)
    await UserStates.WAITING_FOR_FIRST_RESPONSE.set()
    #
    #
    # target_string = re.search(".+\s(to|->)\s.+\S+", message.text)
    # if not target_string:
    #     await message.answer("Wrong format. Use alias to category")
    #     return
    # alias = re.search("(?<=/ro\s)\S+.+(?=\s->)", message.text)
    # if not alias:
    #     alias = re.search("(?<=/ro\s)\S+.+(?=\sto)", message.text)
    # alias = alias.group()
    #
    # category = re.search("(?<=->\s).+\S+", message.text)
    # if not category:
    #     category = re.search("(?<=to\s).+\S+", message.text).group()
    # category = category.group()
    # categories_module.set_new_name_to_alias(alias, category)
    # await message.answer(f"Successfullty transfered alias {alias} to {category} category")


@dp.message_handler(IsAdmin(), state=UserStates.WAITING_FOR_FIRST_RESPONSE)
async def restructure_other2(message: types.Message, state: FSMContext):
    alias = message.text
    await state.update_data(first_response=alias)
    similar_aliases = categories_module.get_aliases_most_similar(alias, 5)
    similar_products = [categories_module.get_product_by_alias(al) for al in similar_aliases]
    similar_aliases_names = [product.name for product in set(similar_products)]
    keyboard = ReplyKeyboardMarkup(selective=True)
    buttons = [KeyboardButton(text=name) for name in similar_aliases_names]
    keyboard.add(*buttons)
    await message.answer(f"Выберите имя или впишите новое", reply_markup=keyboard)
    await UserStates.WAITING_FOR_SECOND_RESPONSE.set()


@dp.message_handler(IsAdmin(), state=UserStates.WAITING_FOR_SECOND_RESPONSE)
async def restructure_other3(message: types.Message, state: FSMContext):
    name = message.text
    data = await state.get_data()
    alias = data.get('first_response')
    categories_module.set_new_name_to_alias(alias, name)
    await message.answer(f"Успешно назначили имя {name} алиасу {alias}")
    await state.finish()


@dp.message_handler(IsAdmin(), commands=['gm__'])
async def get_messages(message: types.Message):
    await message.answer(messages.get_messages())
