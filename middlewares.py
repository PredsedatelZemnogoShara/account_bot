"""Аутентификация — пропускаем сообщения только от одного Telegram аккаунта"""
from typing import List

from aiogram import types
from aiogram.dispatcher.handler import CancelHandler
from aiogram.dispatcher.middlewares import BaseMiddleware


class AccessMiddleware(BaseMiddleware):
    def __init__(self, access_ids: List[int]):
        self.access_ids = [int(i) for i in access_ids]
        super().__init__()

    async def on_process_message(self, message: types.Message, _):
        if int(message.from_user.id) not in self.access_ids:
            await message.answer("Access Denied")
            raise CancelHandler()
