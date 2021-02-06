# coding: utf-8

"""
Простой тест работоспособности обёртки.
"""

import sys
from ctypes import create_string_buffer
from irbis import connect, disconnect, read_record, get_max_mfn, \
    hide_window, IRBIS_CATALOG, error_to_string, utf_to_string, \
    IC_nfields, IC_fieldn, IC_field

# Устанавливаем блокирующий режим сокета,
# чтобы не появлялось ненужное окно
hide_window()

# данные для подключения к серверу
HOST = '127.0.0.1'
PORT = '6666'
ARM = IRBIS_CATALOG
USER = 'librarian'
PASSWORD = 'secret'
DB = 'IBIS'

# Подключение к серверу
rc, ini = connect(HOST, PORT, ARM, USER, PASSWORD)
print('connect=', rc)
if rc < 0:
    print(error_to_string(rc))
    print('EXIT')
    sys.exit(1)
else:
    print('connect.length=', len(ini))
    print('connect=', ini)

# Чтение записи
rc, record = read_record(DB, 1)
print('IC_read=', rc)
if rc < 0:
    print('IC_read=', error_to_string(rc))
else:
    print('IC_read=', utf_to_string(record.value))

# Получение количества полей
print()
rc = IC_nfields(record.value)
print('IC_nfields=', rc)

# Получение подполя v200^a
rc = IC_fieldn(record.value, 200, 1)
print('IC_fieldn', rc)
answer = create_string_buffer(32000)
rc = IC_field(record.value, rc, b'a', answer, len(answer))
print('IC_field=', rc)
if rc >= 0:
    print('IC_field=', utf_to_string(answer.value))

# Получение максимального MFN
rc = get_max_mfn(DB)
print('IC_maxmfn=', rc)

# Отключение от сервера
print()
rc = disconnect(USER)
print('IC_unreg=', rc)

print()
print('That''s All, Folks!')