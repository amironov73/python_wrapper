# coding: utf-8

"""
Модуль содержит основную функциональность по работе с сервером ИРБИС64,
в т. ч. для манипуляций с записями.
"""

from irbis.constants import NO_ERROR, ERR_USER, ERR_BUSY, \
    ERR_UNKNOWN, ERR_BUFSIZE, TERM_NOT_EXISTS, TERM_LAST_IN_LIST, \
    TERM_FIRST_IN_LIST, ERR_DBEWLOCK, ERR_RECLOCKED, VERSION_ERROR, \
    READ_WRONG_MFN, REC_DELETE, REC_PHYS_DELETE, ERROR_CLIENT_FMT, \
    SERVER_EXECUTE_ERROR, ANSWER_LENGTH_ERROR, WRONG_PROTOCOL, \
    CLIENT_NOT_IN_LIST, CLIENT_NOT_IN_USE, CLIENT_IDENTIFIER_WRONG, \
    CLIENT_LIST_OVERLOAD, CLIENT_ALREADY_EXISTS, CLIENT_NOT_ALLOWED, \
    WRONG_PASSWORD, FILE_NOT_EXISTS, SERVER_OVERLOAD, PROCESS_ERROR, \
    GLOBAL_ERROR, SYSPATH, DATAPATH, DBNPATH2, DBNPATH3, DBNPATH10, \
    FULLTEXTPATH, INTERNALRESOURCEPATH, IRBIS_READER, \
    IRBIS_ADMINISTRATOR, IRBIS_CATALOG, IRBIS_COMPLECT, \
    IRBIS_BOOKLAND, IRBIS_BOOKPROVD, MAX_POSTINGS_IN_PACKET, \
    ANSI, UTF

from irbis.dllwrapper import IC_reg, IC_unreg, \
    IC_set_client_time_live, IC_set_show_waiting, IC_set_webserver, \
    IC_set_webcgi, IC_set_blocksocket, IC_isbusy, IC_update_ini, \
    IC_getresourse, IC_clearresourse, IC_getresoursegroup, \
    IC_getbinaryresourse, IC_putresourse, IC_read, IC_readformat, \
    IC_update, IC_updategroup, IC_runlock, IC_ifupdate, IC_maxmfn

from irbis.comfort import connect, disconnect, read_record, \
    get_max_mfn, hide_window

__all__ = ['NO_ERROR', 'ERR_USER', 'ERR_BUSY', 'ERR_UNKNOWN',
           'ERR_BUFSIZE', 'TERM_NOT_EXISTS', 'TERM_LAST_IN_LIST',
           'TERM_FIRST_IN_LIST', 'ERR_DBEWLOCK', 'ERR_RECLOCKED',
           'VERSION_ERROR', 'READ_WRONG_MFN', 'REC_DELETE',
           'REC_PHYS_DELETE', 'ERROR_CLIENT_FMT',
           'SERVER_EXECUTE_ERROR', 'ANSWER_LENGTH_ERROR',
           'WRONG_PROTOCOL', 'CLIENT_NOT_IN_LIST',
           'CLIENT_NOT_IN_USE', 'CLIENT_IDENTIFIER_WRONG',
           'CLIENT_LIST_OVERLOAD', 'CLIENT_ALREADY_EXISTS',
           'CLIENT_NOT_ALLOWED', 'WRONG_PASSWORD', 'FILE_NOT_EXISTS',
           'SERVER_OVERLOAD', 'PROCESS_ERROR', 'GLOBAL_ERROR',
           'SYSPATH', 'DATAPATH', 'DBNPATH2', 'DBNPATH3', 'DBNPATH10',
           'FULLTEXTPATH', 'INTERNALRESOURCEPATH', 'IRBIS_READER',
           'IRBIS_ADMINISTRATOR', 'IRBIS_CATALOG', 'IRBIS_COMPLECT',
           'IRBIS_BOOKLAND', 'IRBIS_BOOKPROVD',
           'MAX_POSTINGS_IN_PACKET', 'ANSI', 'UTF',
           'IC_reg', 'IC_unreg', 'IC_set_client_time_live',
           'IC_set_show_waiting', 'IC_set_webserver', 'IC_set_webcgi',
           'IC_set_blocksocket', 'IC_isbusy', 'IC_update_ini',
           'IC_getresourse', 'IC_clearresourse', 'IC_getresoursegroup',
           'IC_getbinaryresourse', 'IC_putresourse', 'IC_read',
           'IC_readformat', 'IC_update', 'IC_updategroup',
           'IC_runlock', 'IC_ifupdate', 'IC_maxmfn',
           'connect', 'disconnect', 'read_record', 'get_max_mfn',
           'hide_window']
