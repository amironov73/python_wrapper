unit IRBIS64_CLIENT;
{���� ���������� �������, �������� � ����� �������� ��� irbis64_client.dll}
interface

const
{���� ���������}
ERR_USER = -1; {������ ���������� - �������� ������������� ��� ����� ������}
ERR_BUSY = -2; {�� ��������� ��������� ����������� �������}
ERR_UNKNOWN = -3; {����������� ������}
ERR_BUFSIZE = -4; {�������� ����� ���}
ZERO = 0;{0 - ���������� ����������}
ERR_DBEWLOCK = - 300;{����������� ���������� ��}
ERR_RECLOCKED = -602;{������ ������������� �� ����}
VERSION_ERROR = -608;//��� ������ ���������� ��������������� ������
READ_WRONG_MFN = -140;{-1 - �������� MFN ��� �������� ��}
REC_DELETE = -603;{1 - ������ ��������� �������}
REC_PHYS_DELETE = -605;{2 - ������ ��������� �������}
ERROR_CLIENT_FMT=999;
SERVER_EXECUTE_ERROR = -1111;
WRONG_PROTOCOL = -2222;
CLIENT_NOT_IN_LIST = -3333;{�������������������� ������}
CLIENT_NOT_IN_USE = -3334;{�������������������� ������ �� ������ irbis-reg}
CLIENT_IDENTIFIER_WRONG = -3335;{����� ���������� �������������}
CLIENT_LIST_OVERLOAD = -3336;{���������������� ����������� ���������� ���������� ��������}
CLIENT_ALREADY_EXISTS = -3337;{������ ��� ���������������}
CLIENT_NOT_ALLOWED = -3338;{��� ������� � �������� ����}
WRONG_PASSWORD = -4444;{�������� ������}
FILE_NOT_EXISTS = -5555;
SERVER_OVERLOAD = -6666;{������ ���������� ���������� ������������ ����� ������� ���������}
PROCESS_ERROR = -7777;{�� ������� ���������/�������� ����� ��� ������� ��������������}
GLOBAL_ERROR = -8888;//gbl ����������
ANSWER_LENGTH_ERROR = -1112;//������������� ���������� � �������� �����
TERM_NOT_EXISTS = -202;
TERM_LAST_IN_LIST = -203;
TERM_FIRST_IN_LIST = -204;

{���� ����� �����}
SYSPATH = 0;
DATAPATH = 1;
DBNPATH2 = 2;
DBNPATH3 = 3;
DBNPATH10 = 10;
FULLTEXTPATH = 11;
INTERNALRESOURCEPATH = 12;

{���� �����}
IRBIS_READER = 'R';
IRBIS_ADMINISTRATOR = 'A';
IRBIS_CATALOG = 'C';
IRBIS_COMPLECT = 'M';
IRBIS_BOOKLAND = 'B';
IRBIS_BOOKPROVD = 'K';

MAX_POSTINGS_IN_PACKET = 32758;{������������ ����� ������ � ������ � �������}

type TBuffer = packed record
   size:integer;
   capacity:integer;
   data:PChar;
   end;
type PBuffer = ^TBuffer;

{������������� � ����������� ������� ��� ������ � ��������}
function IC_reg(aserver_host: Pchar;
                           aserver_port: Pchar;
                           arm:char;
                           user_name,password: Pchar;
                           var answer: Pchar; abufsize: integer):integer; stdcall;
{���-����������� ��� ������������� � ������� ������� CLIENT_TIME_LIVE ������� �������� � �������
����� ������� ����������� ����� ������ ���������� file.ini}
function IC_unreg(user_name: Pchar): integer; stdcall;


{������� ��������� �������� ����������}
function IC_set_webserver(Aopt: integer): integer; stdcall;
function IC_set_webcgi(Acgi: Pchar): integer; stdcall;
function IC_set_blocksocket(Aopt: integer): integer; stdcall;
function IC_set_show_waiting(Aopt: integer): integer; stdcall;
function IC_set_client_time_live(Aopt: integer): integer; stdcall;
{������� �������� ���������}
function IC_isbusy: integer; stdcall;


{������� ������ � ���������}
{������� ���������� INI-����� ������� �� �������}
function IC_update_ini(inifile: Pchar): integer; stdcall;
{������� ������ ���������� �������}
function IC_getresourse(Apath: integer; Adbn,Afilename: Pchar; var answer: Pchar; abufsize: integer): integer; stdcall;
{������� ���� ��������}
function IC_clearresourse: integer; stdcall;
{������� ���������� ������ ��������� ��������}
function IC_getresoursegroup(var acontext: Pchar; var answer: Pchar; abufsize: integer): integer; stdcall;
{������� ������ ��������� �������}
function IC_getbinaryresourse(Apath: integer; Adbn,Afilename: Pchar; var Abuffer: PBuffer): integer; stdcall;
{������� ������ ���������� �������}
function IC_putresourse(Apath: integer; Adbn,Afilename,Aresourse: Pchar): integer; stdcall;

{������� ������ � ������-������ ���� ������}
{����� ������}
function IC_read(Adbn: Pchar; Amfn,Alock: integer; var answer: Pchar; abufsize: integer): integer; stdcall;
{����� ������ � ������������������}
function IC_readformat(Adbn: Pchar; Amfn,Alock: integer; Aformat: Pchar; var answer: Pchar; abufsize: integer; var answer1: Pchar; abufsize1: integer): integer;  stdcall;
{�������������� ������}
function IC_update(Adbn: Pchar; Alock,Aifupdate: integer; var answer: Pchar; abufsize: integer): integer; stdcall;
{��������� �������������� ������}
function IC_updategroup(Adbn: Pchar; Alock,Aifupdate: integer; var answer: Pchar; abufsize: integer): integer; stdcall;
{��������� �������������� ������ ������� - �������� �� ������ ��}
function IC_updategroup_sinhronize(Alock,Aifupdate: integer; Adbnames: Pchar; var answer: Pchar; abufsize: integer):integer; stdcall;
{�������������� ������}
function IC_runlock(Adbn: Pchar; Amfn: integer): integer; stdcall;
{��������������� ������}
function IC_ifupdate(Adbn: Pchar; Amfn: integer): integer; stdcall;
{������� ������������ MFN ���� ������}
function IC_maxmfn(Adbn: Pchar): integer; stdcall;

{������� ��� ������ � �������}
{���������� ���������� ����� ���� � ������}
function IC_fieldn(Arecord: Pchar; Amet,Aocc: integer): integer; stdcall;
{��������� �������� ����/�������}
function IC_field(Arecord: Pchar; nf: integer; delim: char; answer: Pchar; abufsize: integer): integer; stdcall;
{�������� ���� � ������}
function IC_fldadd(Arecord: Pchar; Amet,nf: integer; pole: Pchar; abufsize: integer): integer; stdcall;
{�������� ����}
function IC_fldrep(Arecord: Pchar; nf: integer; pole: Pchar; abufsize: integer): integer; stdcall;
{���������� ���-�� ����� � ������}
function IC_nfields(Arecord: Pchar): integer; stdcall;
{���������� ���-�� ���������� ���� � �������� ������}
function IC_nocc(Arecord: Pchar; Amet: integer): integer; stdcall;
{���������� ����� ���� � �������� ���������� �������}
function IC_fldtag(Arecord: Pchar; nf: integer): integer; stdcall;
{���������� ������}
function IC_fldempty(Arecord: Pchar): integer; stdcall;
{�������� mfn ������}
function IC_changemfn(Arecord: Pchar; newmfn: integer): integer; stdcall;
{���������� ������� ��������� ��������� ������}
function IC_recdel(Arecord: Pchar): integer; stdcall;
{����� ������� ��������� ��������� ������}
function IC_recundel(Arecord: Pchar): integer; stdcall;
{����� ������� �����������������}
function IC_recunlock(Arecord: Pchar): integer; stdcall;

{��������� mfn ������}
function IC_getmfn(Arecord: Pchar): integer; stdcall;
{������� ������ ������}
function IC_recdummy(Arecord: Pchar; abufsize: integer): integer; stdcall;
{��������� � ������� ������ ������� �������������������}
function IC_isActualized(Arecord: Pchar): integer; stdcall;
{��������� � ������� ������ ������� �����������������}
function IC_isLocked(Arecord: Pchar): integer; stdcall;
{��������� � ������� ������ ������� ���������� �����������}
function IC_isDeleted(Arecord: Pchar): integer; stdcall;

{������� ��� ������ �� �������� ���� ������}
{��������� ������ ��������, ������� � ���������}
function IC_nexttrm(Adbn,Aterm: Pchar; Anumb: integer; answer: Pchar; abufsize: integer): integer; stdcall;
{��������� ������ ��������, ������� � ���������, � ���������������� ��������� �� ������ ������}
function IC_nexttrmgroup(Adbn,Aterm: Pchar; Anumb: integer; Aformat: Pchar; answer: Pchar; abufsize: integer): integer; stdcall;
{��������� ������ ��������, ������� � ���������, � �������� �������}
function IC_prevtrm(Adbn,Aterm: Pchar; Anumb: integer; answer: Pchar; abufsize: integer): integer; stdcall;
{��������� ������ ��������, ������� � ���������, � �������� ������� � ���������������� ��������� �� ������ ������}
function IC_prevtrmgroup(Adbn,Aterm: Pchar; Anumb: integer; Aformat: Pchar; answer: Pchar; abufsize: integer): integer; stdcall;
{��������� ������ ������ ��� ��������� �������}
function IC_posting(Adbn,Aterm: Pchar; Anumb,Afirst: integer; answer: Pchar; abufsize: integer): integer; stdcall;
{��������� ������ ������ ������ ��� ��������� ������ ��������}
function IC_postinggroup(Adbn,Aterms,answer: Pchar; abufsize: integer): integer; stdcall;
{��������� ������ ������ ��� ��������� ������� � ���������������� ������ �� ���������������}
function IC_postingformat(Adbn,Aterm: Pchar; Anumb,Afirst: integer; Aformat: Pchar; answer1: Pchar; abufsize1: integer; answer: Pchar; abufsize: integer): integer; stdcall;

{������� ������}
{������ ����� ������� �� ��������� ���������� ���������}
function IC_search(Adbn,Asexp: Pchar; Anumb,Afirst: integer; Aformat: Pchar; answer: Pchar; abufsize: integer): integer; stdcall;
{���������������� ����� �� ���������� ������� ������ �/��� �� ��������� ��������� �������}
function IC_searchscan(Adbn,Asexp: Pchar; Anumb,Afirst: integer; Aformat: Pchar; Amin,Amax: integer; Aseq: Pchar; answer: Pchar; abufsize: integer): integer; stdcall;

{������� ��������������}
{�������������� ������ �� MFN}
function IC_sformat(Adbn: Pchar; Amfn: integer; Aformat: Pchar; answer: Pchar; abufsize: integer): integer; stdcall;
{�������������� ������ � ���������� �������������}
function IC_record_sformat(Adbn, Aformat,Arecord: Pchar; answer: Pchar; abufsize: integer): integer; stdcall;
{�������������� ������ �������}
function IC_sformatgroup(Adbn,Amfnlist,Aformat: Pchar; answer: Pchar; abufsize: integer): integer; stdcall;

{�������� �������}
{�������� �������� ��������� ����� �� ��������� ������ �������}
function IC_print(Adbn,Atab,Ahead,Amod,Asexp: Pchar; Amin,Amax: integer; Aseq,Amfnlist: Pchar; answer: Pchar; abufsize: integer): integer; stdcall;
{�������� �������� ����� �������������� ������������� �������� ���������� �� ��������� ������ �������}
function IC_stat(Adbn,Astat,Asexp: Pchar; Amin,Amax: integer; Aseq,Amfnlist: Pchar; answer: Pchar; abufsize: integer): integer; stdcall;
{��������� ���������� ������������� ��������� ������ �������}
function IC_gbl(Adbn: Pchar; Aifupdate: integer; Agbl,Asexp: Pchar; Amin,Amax: integer; Aseq,Amfnlist: Pchar; answer: Pchar; abufsize: integer): integer;  stdcall;

{������� ��������������}
{������������� ������}
function IC_adm_restartserver:  integer;  stdcall;
{�������� ������ ��������� ����������}
function IC_adm_getDeletedList(Adbn: Pchar; answer: Pchar; abufsize: integer):integer; stdcall;
function IC_adm_getallDeletedLists(Adbn: Pchar; answer: Pchar; abufsize: integer):integer; stdcall;
{����������� ��}
function IC_adm_dbempty(Adbn: Pchar):integer; stdcall;
{�������� ��}
function IC_adm_dbdelete(Adbn: Pchar):integer; stdcall;
{�������� ����� ��}
function IC_adm_newdb(Adbn,Adef: Pchar; AReader: integer):integer; stdcall;
{����� ����������� ���������� ��}
function IC_adm_DBunlock(Adbn: Pchar):integer; stdcall;
{����� ���������� ������� (MFN)}
function IC_adm_DBunlockMFN(Adbn: Pchar; Amfnlist: Pchar):integer; stdcall;
{������� ������� ������}
function IC_adm_DBStartCreateDictionry(Adbn: Pchar):integer; stdcall;
{�������������� ���� �������}
function IC_adm_DBStartReorgDictionry(Adbn: Pchar):integer;  stdcall;
{�������������� ���� ����������}
function IC_adm_DBStartReorgMaster(Adbn: Pchar):integer;  stdcall;
{������ ������������������ ��������}
function IC_adm_getClientlist(answer: Pchar; abufsize: integer):integer; stdcall;
{������ �������� ��� ������� � �������}
function IC_adm_getClientslist(answer: Pchar; abufsize: integer):integer; stdcall;
{������ ���������� ���������}
function IC_adm_getProcessList(answer: Pchar; abufsize: integer):integer; stdcall;
{�������� ������ �������� ��� ������� � �������}
function IC_adm_SetClientslist(AClientMnu: Pchar):integer; stdcall;



{��������������� �������}
{������������ �����������}
function IC_nooperation:integer; stdcall
{�������� ������� ������}
function IC_getposting(APost: Pchar; AType: integer): integer; stdcall;
{�������� �������� ����������� ����� $0D0A �� ����������������� $3130}
function IC_reset_delim(Aline: Pchar): Pchar; stdcall;
{�������� ����������������� ����������� ����� $3130 �� �������� $0D0A}
function IC_delim_reset(Aline: Pchar): Pchar; stdcall;

implementation


{������������� � ����������� ������� ��� ������ � ��������}
function IC_reg(aserver_host: Pchar;
                           aserver_port: Pchar;
                           arm:char;
                           user_name,password: Pchar;
                           var answer: Pchar; abufsize: integer):integer;  external 'irbis64_client.dll';
{���-����������� ��� ������������� � ������� ������� CLIENT_TIME_LIVE ������� �������� � �������
����� ������� ����������� ����� ������ ���������� file.ini}
function IC_unreg(user_name: Pchar): integer;  external 'irbis64_client.dll';


{������� ��������� �������� ����������}
function IC_set_webserver(Aopt: integer): integer;   external 'irbis64_client.dll';
function IC_set_webcgi(Acgi: Pchar): integer;   external 'irbis64_client.dll';
function IC_set_blocksocket(Aopt: integer): integer;   external 'irbis64_client.dll';
function IC_set_show_waiting(Aopt: integer): integer;   external 'irbis64_client.dll';
function IC_set_client_time_live(Aopt: integer): integer;   external 'irbis64_client.dll';
{������� �������� ���������}
function IC_isbusy: integer;  external 'irbis64_client.dll';


{������� ������ � ���������}
{������� ���������� INI-����� ������� �� �������}
function IC_update_ini(inifile: Pchar): integer;  external 'irbis64_client.dll';
{������� ������ ���������� �������}
function IC_getresourse(Apath: integer; Adbn,Afilename: Pchar; var answer: Pchar; abufsize: integer): integer;  external 'irbis64_client.dll';
{������� ���� ��������}
function IC_clearresourse: integer;  external 'irbis64_client.dll';
{������� ���������� ������ ��������� ��������}
function IC_getresoursegroup(var acontext: Pchar; var answer: Pchar; abufsize: integer): integer;  external 'irbis64_client.dll';
{������� ������ ��������� �������}
function IC_getbinaryresourse(Apath: integer; Adbn,Afilename: Pchar; var Abuffer: PBuffer): integer;   external 'irbis64_client.dll';
{������� ������ ���������� �������}
function IC_putresourse(Apath: integer; Adbn,Afilename,Aresourse: Pchar): integer;   external 'irbis64_client.dll';

{������� ������ � ������-������ ���� ������}
{����� ������}
function IC_read(Adbn: Pchar; Amfn,Alock: integer; var answer: Pchar; abufsize: integer): integer;  external 'irbis64_client.dll';
{����� ������ � ������������������}
function IC_readformat(Adbn: Pchar; Amfn,Alock: integer; Aformat: Pchar; var answer: Pchar; abufsize: integer; var answer1: Pchar; abufsize1: integer): integer;    external 'irbis64_client.dll';
{�������������� ������}
function IC_update(Adbn: Pchar; Alock,Aifupdate: integer; var answer: Pchar; abufsize: integer): integer;  external 'irbis64_client.dll';
{��������� �������������� ������}
function IC_updategroup(Adbn: Pchar; Alock,Aifupdate: integer; var answer: Pchar; abufsize: integer): integer;   external 'irbis64_client.dll';
{��������� �������������� ������ ������� - �������� �� ������ ��}
function IC_updategroup_sinhronize(Alock,Aifupdate: integer; Adbnames: Pchar; var answer: Pchar; abufsize: integer):integer;  external 'irbis64_client.dll';
{�������������� ������}
function IC_runlock(Adbn: Pchar; Amfn: integer): integer;  external 'irbis64_client.dll';
{��������������� ������}
function IC_ifupdate(Adbn: Pchar; Amfn: integer): integer;  external 'irbis64_client.dll';
{������� ������������ MFN ���� ������}
function IC_maxmfn(Adbn: Pchar): integer;  external 'irbis64_client.dll';

{������� ��� ������ � �������}
{���������� ���������� ����� ���� � ������}
function IC_fieldn(Arecord: Pchar; Amet,Aocc: integer): integer;    external 'irbis64_client.dll';
{��������� �������� ����/�������}
function IC_field(Arecord: Pchar; nf: integer; delim: char; answer: Pchar; abufsize: integer): integer;     external 'irbis64_client.dll';
{�������� ���� � ������}
function IC_fldadd(Arecord: Pchar; Amet,nf: integer; pole: Pchar; abufsize: integer): integer;     external 'irbis64_client.dll';
{�������� ����}
function IC_fldrep(Arecord: Pchar; nf: integer; pole: Pchar; abufsize: integer): integer;     external 'irbis64_client.dll';
{���������� ���-�� ����� � ������}
function IC_nfields(Arecord: Pchar): integer;     external 'irbis64_client.dll';
{���������� ���-�� ���������� ���� � �������� ������}
function IC_nocc(Arecord: Pchar; Amet: integer): integer;     external 'irbis64_client.dll';
{���������� ����� ���� � �������� ���������� �������}
function IC_fldtag(Arecord: Pchar; nf: integer): integer;     external 'irbis64_client.dll';
{���������� ������}
function IC_fldempty(Arecord: Pchar): integer;     external 'irbis64_client.dll';
{�������� mfn ������}
function IC_changemfn(Arecord: Pchar; newmfn: integer): integer;     external 'irbis64_client.dll';
{���������� ������� ��������� ��������� ������}
function IC_recdel(Arecord: Pchar): integer;     external 'irbis64_client.dll';
{����� ������� ��������� ��������� ������}
function IC_recundel(Arecord: Pchar): integer;     external 'irbis64_client.dll';
{����� ������� �����������������}
function IC_recunlock(Arecord: Pchar): integer;    external 'irbis64_client.dll';

{��������� mfn ������}
function IC_getmfn(Arecord: Pchar): integer;    external 'irbis64_client.dll';
{������� ������ ������}
function IC_recdummy(Arecord: Pchar; abufsize: integer): integer; external 'irbis64_client.dll';
{��������� � ������� ������ ������� �������������������}
function IC_isActualized(Arecord: Pchar): integer; external 'irbis64_client.dll';
{��������� � ������� ������ ������� �����������������}
function IC_isLocked(Arecord: Pchar): integer;     external 'irbis64_client.dll';
{��������� � ������� ������ ������� ���������� �����������}
function IC_isDeleted(Arecord: Pchar): integer;    external 'irbis64_client.dll';

{������� ��� ������ �� �������� ���� ������}
{��������� ������ ��������, ������� � ���������}
function IC_nexttrm(Adbn,Aterm: Pchar; Anumb: integer; answer: Pchar; abufsize: integer): integer; external 'irbis64_client.dll';
{��������� ������ ��������, ������� � ���������, � ���������������� ��������� �� ������ ������}
function IC_nexttrmgroup(Adbn,Aterm: Pchar; Anumb: integer; Aformat: Pchar; answer: Pchar; abufsize: integer): integer; external 'irbis64_client.dll';
{��������� ������ ��������, ������� � ���������, � �������� �������}
function IC_prevtrm(Adbn,Aterm: Pchar; Anumb: integer; answer: Pchar; abufsize: integer): integer; external 'irbis64_client.dll';
{��������� ������ ��������, ������� � ���������, � �������� ������� � ���������������� ��������� �� ������ ������}
function IC_prevtrmgroup(Adbn,Aterm: Pchar; Anumb: integer; Aformat: Pchar; answer: Pchar; abufsize: integer): integer; external 'irbis64_client.dll';
{��������� ������ ������ ��� ��������� �������}
function IC_posting(Adbn,Aterm: Pchar; Anumb,Afirst: integer; answer: Pchar; abufsize: integer): integer; external 'irbis64_client.dll';
{��������� ������ ������ ������ ��� ��������� ������ ��������}
function IC_postinggroup(Adbn,Aterms,answer: Pchar; abufsize: integer): integer; external 'irbis64_client.dll';
{��������� ������ ������ ��� ��������� ������� � ���������������� ������ �� ���������������}
function IC_postingformat(Adbn,Aterm: Pchar; Anumb,Afirst: integer; Aformat: Pchar; answer1: Pchar; abufsize1: integer; answer: Pchar; abufsize: integer): integer; external 'irbis64_client.dll';

{������� ������}
{������ ����� ������� �� ��������� ���������� ���������}
function IC_search(Adbn,Asexp: Pchar; Anumb,Afirst: integer; Aformat: Pchar; answer: Pchar; abufsize: integer): integer; external 'irbis64_client.dll';
{���������������� ����� �� ���������� ������� ������ �/��� �� ��������� ��������� �������}
function IC_searchscan(Adbn,Asexp: Pchar; Anumb,Afirst: integer; Aformat: Pchar; Amin,Amax: integer; Aseq: Pchar; answer: Pchar; abufsize: integer): integer; external 'irbis64_client.dll';

{������� ��������������}
{�������������� ������ �� MFN}
function IC_sformat(Adbn: Pchar; Amfn: integer; Aformat: Pchar; answer: Pchar; abufsize: integer): integer; external 'irbis64_client.dll';
{�������������� ������ � ���������� �������������}
function IC_record_sformat(Adbn, Aformat,Arecord: Pchar; answer: Pchar; abufsize: integer): integer;  external 'irbis64_client.dll';
{�������������� ������ �������}
function IC_sformatgroup(Adbn,Amfnlist,Aformat: Pchar; answer: Pchar; abufsize: integer): integer;  external 'irbis64_client.dll';

{�������� �������}
{�������� �������� ��������� ����� �� ��������� ������ �������}
function IC_print(Adbn,Atab,Ahead,Amod,Asexp: Pchar; Amin,Amax: integer; Aseq,Amfnlist: Pchar; answer: Pchar; abufsize: integer): integer;  external 'irbis64_client.dll';
{�������� �������� ����� �������������� ������������� �������� ���������� �� ��������� ������ �������}
function IC_stat(Adbn,Astat,Asexp: Pchar; Amin,Amax: integer; Aseq,Amfnlist: Pchar; answer: Pchar; abufsize: integer): integer; external 'irbis64_client.dll';
{��������� ���������� ������������� ��������� ������ �������}
function IC_gbl(Adbn: Pchar; Aifupdate: integer; Agbl,Asexp: Pchar; Amin,Amax: integer; Aseq,Amfnlist: Pchar; answer: Pchar; abufsize: integer): integer;  external 'irbis64_client.dll';

{������������� ������}
function IC_adm_restartserver:  integer;  external 'irbis64_client.dll';
function IC_adm_getDeletedList(Adbn: Pchar; answer: Pchar; abufsize: integer):integer;  external 'irbis64_client.dll';
function IC_adm_getallDeletedLists(Adbn: Pchar; answer: Pchar; abufsize: integer):integer; external 'irbis64_client.dll';
{����������� ��}
function IC_adm_dbempty(Adbn: Pchar):integer; external 'irbis64_client.dll';
{�������� ��}
function IC_adm_dbdelete(Adbn: Pchar):integer; external 'irbis64_client.dll';
{�������� ����� ��}
function IC_adm_newdb(Adbn,Adef: Pchar; AReader: integer):integer; external 'irbis64_client.dll';
{����� ����������� ���������� ��}
function IC_adm_DBunlock(Adbn: Pchar):integer; external 'irbis64_client.dll';
{����� ���������� ������� (MFN)}
function IC_adm_DBunlockMFN(Adbn: Pchar; Amfnlist: Pchar):integer; external 'irbis64_client.dll';
{������� ������� ������}
function IC_adm_DBStartCreateDictionry(Adbn: Pchar):integer;  external 'irbis64_client.dll';
{�������������� ���� �������}
function IC_adm_DBStartReorgDictionry(Adbn: Pchar):integer;  external 'irbis64_client.dll';
{�������������� ���� ����������}
function IC_adm_DBStartReorgMaster(Adbn: Pchar):integer;  external 'irbis64_client.dll';
{������ ������������������ ��������}
function IC_adm_getClientlist(answer: Pchar; abufsize: integer):integer;  external 'irbis64_client.dll';
{������ �������� ��� ������� � �������}
function IC_adm_getClientslist(answer: Pchar; abufsize: integer):integer; external 'irbis64_client.dll';
{������ ���������� ���������}
function IC_adm_getProcessList(answer: Pchar; abufsize: integer):integer; external 'irbis64_client.dll';
{�������� ������ �������� ��� ������� � �������}
function IC_adm_SetClientslist(AClientMnu: Pchar):integer; external 'irbis64_client.dll';


{��������������� �������}
{������������ �����������}
function IC_nooperation:integer; external 'irbis64_client.dll';
{�������� ������� ������}
function IC_getposting(APost: Pchar; AType: integer): integer;   external 'irbis64_client.dll';
{�������� �������� ����������� ����� $0D0A �� ����������������� $3130}
function IC_reset_delim(Aline: Pchar): Pchar;    external 'irbis64_client.dll';
{�������� ����������������� ����������� ����� $3130 �� �������� $0D0A}
function IC_delim_reset(Aline: Pchar): Pchar;    external 'irbis64_client.dll';
end.


