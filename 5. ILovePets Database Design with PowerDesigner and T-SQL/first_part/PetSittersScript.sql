/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2008                    */
/* Created on:     06-Oct-24 21:08:38                           */
/*==============================================================*/


if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('ALLOWS') and o.name = 'FK_ALLOWS_ALLOWS_SESSIONS')
alter table ALLOWS
   drop constraint FK_ALLOWS_ALLOWS_SESSIONS
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('ALLOWS') and o.name = 'FK_ALLOWS_ALLOWS2_BREEDS')
alter table ALLOWS
   drop constraint FK_ALLOWS_ALLOWS2_BREEDS
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('BEHAVES') and o.name = 'FK_BEHAVES_BEHAVES_TEMPERAM')
alter table BEHAVES
   drop constraint FK_BEHAVES_BEHAVES_TEMPERAM
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('BEHAVES') and o.name = 'FK_BEHAVES_BEHAVES2_PETS')
alter table BEHAVES
   drop constraint FK_BEHAVES_BEHAVES2_PETS
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('BOOKINGS') and o.name = 'FK_BOOKINGS_HAVE_PETS')
alter table BOOKINGS
   drop constraint FK_BOOKINGS_HAVE_PETS
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('BOOKINGS') and o.name = 'FK_BOOKINGS_RESERVES__SESSIONS')
alter table BOOKINGS
   drop constraint FK_BOOKINGS_RESERVES__SESSIONS
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('BREEDS') and o.name = 'FK_BREEDS_BELONGS_T_SPECIES')
alter table BREEDS
   drop constraint FK_BREEDS_BELONGS_T_SPECIES
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CHATS') and o.name = 'FK_CHATS_PARTICIPA_OWNERS')
alter table CHATS
   drop constraint FK_CHATS_PARTICIPA_OWNERS
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CHATS') and o.name = 'FK_CHATS_PARTICIPA_SITTERS')
alter table CHATS
   drop constraint FK_CHATS_PARTICIPA_SITTERS
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('MESSAGES') and o.name = 'FK_MESSAGES_CONTAINS_CHATS')
alter table MESSAGES
   drop constraint FK_MESSAGES_CONTAINS_CHATS
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('OWNERS') and o.name = 'FK_OWNERS_DESCRIBES_USERS')
alter table OWNERS
   drop constraint FK_OWNERS_DESCRIBES_USERS
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PETS') and o.name = 'FK_PETS_IS_TYPE_O_BREEDS')
alter table PETS
   drop constraint FK_PETS_IS_TYPE_O_BREEDS
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PETS') and o.name = 'FK_PETS_OWNS_OWNERS')
alter table PETS
   drop constraint FK_PETS_OWNS_OWNERS
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PREFERS') and o.name = 'FK_PREFERS_PREFERS_SITTERS')
alter table PREFERS
   drop constraint FK_PREFERS_PREFERS_SITTERS
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PREFERS') and o.name = 'FK_PREFERS_PREFERS2_BREEDS')
alter table PREFERS
   drop constraint FK_PREFERS_PREFERS2_BREEDS
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('SESSIONS') and o.name = 'FK_SESSIONS_GENERATES_TIME_SLO')
alter table SESSIONS
   drop constraint FK_SESSIONS_GENERATES_TIME_SLO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('SITTERS') and o.name = 'FK_SITTERS_DESCRIBES_USERS')
alter table SITTERS
   drop constraint FK_SITTERS_DESCRIBES_USERS
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('SPECIALISES_IN') and o.name = 'FK_SPECIALI_SPECIALIS_SITTERS')
alter table SPECIALISES_IN
   drop constraint FK_SPECIALI_SPECIALIS_SITTERS
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('SPECIALISES_IN') and o.name = 'FK_SPECIALI_SPECIALIS_AREAS_EX')
alter table SPECIALISES_IN
   drop constraint FK_SPECIALI_SPECIALIS_AREAS_EX
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TIME_SLOTS') and o.name = 'FK_TIME_SLO_DEFINES_SITTERS')
alter table TIME_SLOTS
   drop constraint FK_TIME_SLO_DEFINES_SITTERS
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TIME_SLOTS') and o.name = 'FK_TIME_SLO_RECURRS_I_RECURREN')
alter table TIME_SLOTS
   drop constraint FK_TIME_SLO_RECURRS_I_RECURREN
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('VACCINE_DOCUMENTS') and o.name = 'FK_VACCINE__IS_VACCIN_PETS')
alter table VACCINE_DOCUMENTS
   drop constraint FK_VACCINE__IS_VACCIN_PETS
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('VACCINE_DOCUMENTS') and o.name = 'FK_VACCINE__REFERENCE_VACCINES')
alter table VACCINE_DOCUMENTS
   drop constraint FK_VACCINE__REFERENCE_VACCINES
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('ALLOWS')
            and   name  = 'ALLOWS2_FK'
            and   indid > 0
            and   indid < 255)
   drop index ALLOWS.ALLOWS2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('ALLOWS')
            and   name  = 'ALLOWS_FK'
            and   indid > 0
            and   indid < 255)
   drop index ALLOWS.ALLOWS_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('ALLOWS')
            and   type = 'U')
   drop table ALLOWS
go

if exists (select 1
            from  sysobjects
           where  id = object_id('AREAS_EXPERTISE')
            and   type = 'U')
   drop table AREAS_EXPERTISE
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('BEHAVES')
            and   name  = 'BEHAVES2_FK'
            and   indid > 0
            and   indid < 255)
   drop index BEHAVES.BEHAVES2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('BEHAVES')
            and   name  = 'BEHAVES_FK'
            and   indid > 0
            and   indid < 255)
   drop index BEHAVES.BEHAVES_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('BEHAVES')
            and   type = 'U')
   drop table BEHAVES
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('BOOKINGS')
            and   name  = 'RESERVES_PLACE_IN_FK'
            and   indid > 0
            and   indid < 255)
   drop index BOOKINGS.RESERVES_PLACE_IN_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('BOOKINGS')
            and   name  = 'HAVE_FK'
            and   indid > 0
            and   indid < 255)
   drop index BOOKINGS.HAVE_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('BOOKINGS')
            and   type = 'U')
   drop table BOOKINGS
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('BREEDS')
            and   name  = 'BELONGS_TO_FK'
            and   indid > 0
            and   indid < 255)
   drop index BREEDS.BELONGS_TO_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('BREEDS')
            and   type = 'U')
   drop table BREEDS
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CHATS')
            and   name  = 'PARTICIPATES_IN_OWNER_FK'
            and   indid > 0
            and   indid < 255)
   drop index CHATS.PARTICIPATES_IN_OWNER_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CHATS')
            and   name  = 'PARTICIPATES_IN_SITTER_FK'
            and   indid > 0
            and   indid < 255)
   drop index CHATS.PARTICIPATES_IN_SITTER_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CHATS')
            and   type = 'U')
   drop table CHATS
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('MESSAGES')
            and   name  = 'CONTAINS_FK'
            and   indid > 0
            and   indid < 255)
   drop index MESSAGES.CONTAINS_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('MESSAGES')
            and   type = 'U')
   drop table MESSAGES
go

if exists (select 1
            from  sysobjects
           where  id = object_id('OWNERS')
            and   type = 'U')
   drop table OWNERS
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PETS')
            and   name  = 'IS_TYPE_OF_FK'
            and   indid > 0
            and   indid < 255)
   drop index PETS.IS_TYPE_OF_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PETS')
            and   name  = 'OWNS_FK'
            and   indid > 0
            and   indid < 255)
   drop index PETS.OWNS_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PETS')
            and   type = 'U')
   drop table PETS
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PREFERS')
            and   name  = 'PREFERS2_FK'
            and   indid > 0
            and   indid < 255)
   drop index PREFERS.PREFERS2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PREFERS')
            and   name  = 'PREFERS_FK'
            and   indid > 0
            and   indid < 255)
   drop index PREFERS.PREFERS_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PREFERS')
            and   type = 'U')
   drop table PREFERS
go

if exists (select 1
            from  sysobjects
           where  id = object_id('RECURRENCE_TYPES')
            and   type = 'U')
   drop table RECURRENCE_TYPES
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('SESSIONS')
            and   name  = 'GENERATES_FK'
            and   indid > 0
            and   indid < 255)
   drop index SESSIONS.GENERATES_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('SESSIONS')
            and   type = 'U')
   drop table SESSIONS
go

if exists (select 1
            from  sysobjects
           where  id = object_id('SITTERS')
            and   type = 'U')
   drop table SITTERS
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('SPECIALISES_IN')
            and   name  = 'SPECIALISES_IN2_FK'
            and   indid > 0
            and   indid < 255)
   drop index SPECIALISES_IN.SPECIALISES_IN2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('SPECIALISES_IN')
            and   name  = 'SPECIALISES_IN_FK'
            and   indid > 0
            and   indid < 255)
   drop index SPECIALISES_IN.SPECIALISES_IN_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('SPECIALISES_IN')
            and   type = 'U')
   drop table SPECIALISES_IN
go

if exists (select 1
            from  sysobjects
           where  id = object_id('SPECIES')
            and   type = 'U')
   drop table SPECIES
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TEMPERAMENTS')
            and   type = 'U')
   drop table TEMPERAMENTS
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('TIME_SLOTS')
            and   name  = 'DEFINES_FK'
            and   indid > 0
            and   indid < 255)
   drop index TIME_SLOTS.DEFINES_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('TIME_SLOTS')
            and   name  = 'RECURRS_IN_INTERVAL_OF_FK'
            and   indid > 0
            and   indid < 255)
   drop index TIME_SLOTS.RECURRS_IN_INTERVAL_OF_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TIME_SLOTS')
            and   type = 'U')
   drop table TIME_SLOTS
go

if exists (select 1
            from  sysobjects
           where  id = object_id('USERS')
            and   type = 'U')
   drop table USERS
go

if exists (select 1
            from  sysobjects
           where  id = object_id('VACCINES')
            and   type = 'U')
   drop table VACCINES
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('VACCINE_DOCUMENTS')
            and   name  = 'IS_VACCINATED_WITH_FK'
            and   indid > 0
            and   indid < 255)
   drop index VACCINE_DOCUMENTS.IS_VACCINATED_WITH_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('VACCINE_DOCUMENTS')
            and   name  = 'REFERENCES_FK'
            and   indid > 0
            and   indid < 255)
   drop index VACCINE_DOCUMENTS.REFERENCES_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('VACCINE_DOCUMENTS')
            and   type = 'U')
   drop table VACCINE_DOCUMENTS
go

/*==============================================================*/
/* Table: ALLOWS                                                */
/*==============================================================*/
create table ALLOWS (
   SESSION_ID           numeric              not null,
   BREED_ID             numeric              not null,
   constraint PK_ALLOWS primary key (SESSION_ID, BREED_ID)
)
go

/*==============================================================*/
/* Index: ALLOWS_FK                                             */
/*==============================================================*/
create index ALLOWS_FK on ALLOWS (
SESSION_ID ASC
)
go

/*==============================================================*/
/* Index: ALLOWS2_FK                                            */
/*==============================================================*/
create index ALLOWS2_FK on ALLOWS (
BREED_ID ASC
)
go

/*==============================================================*/
/* Table: AREAS_EXPERTISE                                       */
/*==============================================================*/
create table AREAS_EXPERTISE (
   EXPERTISE_ID         numeric              identity,
   TITLE                varchar(50)          not null,
   constraint PK_AREAS_EXPERTISE primary key nonclustered (EXPERTISE_ID)
)
go

/*==============================================================*/
/* Table: BEHAVES                                               */
/*==============================================================*/
create table BEHAVES (
   TEMPERAMENT_ID       numeric              not null,
   PET_ID               numeric              not null,
   constraint PK_BEHAVES primary key (TEMPERAMENT_ID, PET_ID)
)
go

/*==============================================================*/
/* Index: BEHAVES_FK                                            */
/*==============================================================*/
create index BEHAVES_FK on BEHAVES (
TEMPERAMENT_ID ASC
)
go

/*==============================================================*/
/* Index: BEHAVES2_FK                                           */
/*==============================================================*/
create index BEHAVES2_FK on BEHAVES (
PET_ID ASC
)
go

/*==============================================================*/
/* Table: BOOKINGS                                              */
/*==============================================================*/
create table BOOKINGS (
   PET_ID               numeric              not null,
   SESSION_ID           numeric              not null,
   PET_RATING           smallint             null,
   PET_COMMENT          varchar(255)         null,
   PET_SITTER_RATING    smallint             null,
   PET_SITTER_COMMENT   varchar(255)         null,
   constraint PK_BOOKINGS primary key (PET_ID, SESSION_ID)
)
go

/*==============================================================*/
/* Index: HAVE_FK                                               */
/*==============================================================*/
create index HAVE_FK on BOOKINGS (
PET_ID ASC
)
go

/*==============================================================*/
/* Index: RESERVES_PLACE_IN_FK                                  */
/*==============================================================*/
create index RESERVES_PLACE_IN_FK on BOOKINGS (
SESSION_ID ASC
)
go

/*==============================================================*/
/* Table: BREEDS                                                */
/*==============================================================*/
create table BREEDS (
   BREED_ID             numeric              identity,
   SPECIES_ID           numeric              not null,
   TITLE                varchar(50)          null,
   constraint PK_BREEDS primary key nonclustered (BREED_ID)
)
go

/*==============================================================*/
/* Index: BELONGS_TO_FK                                         */
/*==============================================================*/
create index BELONGS_TO_FK on BREEDS (
SPECIES_ID ASC
)
go

/*==============================================================*/
/* Table: CHATS                                                 */
/*==============================================================*/
create table CHATS (
   CHAT_ID              numeric              identity,
   SITTER_ID            numeric              not null,
   OWNER_ID             numeric              not null,
   constraint PK_CHATS primary key nonclustered (CHAT_ID),
   constraint AK_UNIQUE_SITTER_OWNE_CHATS unique (SITTER_ID, OWNER_ID)
)
go

/*==============================================================*/
/* Index: PARTICIPATES_IN_SITTER_FK                             */
/*==============================================================*/
create index PARTICIPATES_IN_SITTER_FK on CHATS (
SITTER_ID ASC
)
go

/*==============================================================*/
/* Index: PARTICIPATES_IN_OWNER_FK                              */
/*==============================================================*/
create index PARTICIPATES_IN_OWNER_FK on CHATS (
OWNER_ID ASC
)
go

/*==============================================================*/
/* Table: MESSAGES                                              */
/*==============================================================*/
create table MESSAGES (
   MESSAGE_ID           numeric              identity,
   CHAT_ID              numeric              not null,
   TIMESTAMP            timestamp            not null,
   DIRECTION            bit                  not null,
   CONTENT              varchar(255)         not null,
   constraint PK_MESSAGES primary key nonclustered (MESSAGE_ID)
)
go

/*==============================================================*/
/* Index: CONTAINS_FK                                           */
/*==============================================================*/
create index CONTAINS_FK on MESSAGES (
CHAT_ID ASC
)
go

/*==============================================================*/
/* Table: OWNERS                                                */
/*==============================================================*/
create table OWNERS (
   USER_ID              numeric              not null,
   constraint PK_OWNERS primary key (USER_ID)
)
go

/*==============================================================*/
/* Table: PETS                                                  */
/*==============================================================*/
create table PETS (
   PET_ID               numeric              identity,
   BREED_ID             numeric              not null,
   USER_ID              numeric              not null,
   NAME                 varchar(50)          not null,
   BIRTHYEAR            smallint             not null,
   COMMENTS             varchar(255)         null,
   constraint PK_PETS primary key nonclustered (PET_ID)
)
go

/*==============================================================*/
/* Index: OWNS_FK                                               */
/*==============================================================*/
create index OWNS_FK on PETS (
USER_ID ASC
)
go

/*==============================================================*/
/* Index: IS_TYPE_OF_FK                                         */
/*==============================================================*/
create index IS_TYPE_OF_FK on PETS (
BREED_ID ASC
)
go

/*==============================================================*/
/* Table: PREFERS                                               */
/*==============================================================*/
create table PREFERS (
   USER_ID              numeric              not null,
   BREED_ID             numeric              not null,
   constraint PK_PREFERS primary key (USER_ID, BREED_ID)
)
go

/*==============================================================*/
/* Index: PREFERS_FK                                            */
/*==============================================================*/
create index PREFERS_FK on PREFERS (
USER_ID ASC
)
go

/*==============================================================*/
/* Index: PREFERS2_FK                                           */
/*==============================================================*/
create index PREFERS2_FK on PREFERS (
BREED_ID ASC
)
go

/*==============================================================*/
/* Table: RECURRENCE_TYPES                                      */
/*==============================================================*/
create table RECURRENCE_TYPES (
   RECURRENCE_ID        numeric              identity,
   TITLE                varchar(50)          not null,
   constraint PK_RECURRENCE_TYPES primary key nonclustered (RECURRENCE_ID)
)
go

/*==============================================================*/
/* Table: SESSIONS                                              */
/*==============================================================*/
create table SESSIONS (
   SESSION_ID           numeric              identity,
   SLOT_ID              numeric              not null,
   DATE                 datetime             not null,
   MAX_PETS             int                  null,
   LAT                  varchar(25)          null,
   LON                  varchar(25)          null,
   constraint PK_SESSIONS primary key nonclustered (SESSION_ID)
)
go

/*==============================================================*/
/* Index: GENERATES_FK                                          */
/*==============================================================*/
create index GENERATES_FK on SESSIONS (
SLOT_ID ASC
)
go

/*==============================================================*/
/* Table: SITTERS                                               */
/*==============================================================*/
create table SITTERS (
   USER_ID              numeric              not null,
   HOURLY_RATE          money                not null,
   DEFAULT_MAX_PETS     smallint             null,
   constraint PK_SITTERS primary key (USER_ID)
)
go

/*==============================================================*/
/* Table: SPECIALISES_IN                                        */
/*==============================================================*/
create table SPECIALISES_IN (
   USER_ID              numeric              not null,
   EXPERTISE_ID         numeric              not null,
   constraint PK_SPECIALISES_IN primary key (USER_ID, EXPERTISE_ID)
)
go

/*==============================================================*/
/* Index: SPECIALISES_IN_FK                                     */
/*==============================================================*/
create index SPECIALISES_IN_FK on SPECIALISES_IN (
USER_ID ASC
)
go

/*==============================================================*/
/* Index: SPECIALISES_IN2_FK                                    */
/*==============================================================*/
create index SPECIALISES_IN2_FK on SPECIALISES_IN (
EXPERTISE_ID ASC
)
go

/*==============================================================*/
/* Table: SPECIES                                               */
/*==============================================================*/
create table SPECIES (
   SPECIES_ID           numeric              identity,
   TITLE                varchar(50)          not null,
   constraint PK_SPECIES primary key nonclustered (SPECIES_ID)
)
go

/*==============================================================*/
/* Table: TEMPERAMENTS                                          */
/*==============================================================*/
create table TEMPERAMENTS (
   TEMPERAMENT_ID       numeric              identity,
   TITLE                varchar(50)          not null,
   constraint PK_TEMPERAMENTS primary key nonclustered (TEMPERAMENT_ID)
)
go

/*==============================================================*/
/* Table: TIME_SLOTS                                            */
/*==============================================================*/
create table TIME_SLOTS (
   SLOT_ID              numeric              identity,
   RECURRENCE_ID        numeric              null,
   USER_ID              numeric              not null,
   START_DATE           datetime             not null,
   END_DATE             datetime             not null,
   START_TIME           datetime             not null,
   FINISH_TIME          datetime             not null,
   constraint PK_TIME_SLOTS primary key nonclustered (SLOT_ID)
)
go

/*==============================================================*/
/* Index: RECURRS_IN_INTERVAL_OF_FK                             */
/*==============================================================*/
create index RECURRS_IN_INTERVAL_OF_FK on TIME_SLOTS (
RECURRENCE_ID ASC
)
go

/*==============================================================*/
/* Index: DEFINES_FK                                            */
/*==============================================================*/
create index DEFINES_FK on TIME_SLOTS (
USER_ID ASC
)
go

/*==============================================================*/
/* Table: USERS                                                 */
/*==============================================================*/
create table USERS (
   USER_ID              numeric              identity,
   EMAIL                varchar(50)          not null,
   PHONE                varchar(15)          not null,
   FIRST_NAME           varchar(50)          not null,
   LAST_NAME            varchar(50)          not null,
   constraint PK_USERS primary key nonclustered (USER_ID),
   constraint AK_UNIQUE_EMAIL_USERS unique (EMAIL),
   constraint AK_UNIQUE_PHONE_USERS unique (PHONE)
)
go

/*==============================================================*/
/* Table: VACCINES                                              */
/*==============================================================*/
create table VACCINES (
   VACCINE_ID           numeric              identity,
   TITLE                varchar(50)          not null,
   constraint PK_VACCINES primary key nonclustered (VACCINE_ID)
)
go

/*==============================================================*/
/* Table: VACCINE_DOCUMENTS                                     */
/*==============================================================*/
create table VACCINE_DOCUMENTS (
   VACCINE_ID           numeric              not null,
   PET_ID               numeric              not null,
   DOCUMENT_NUMBER      varchar(50)          not null,
   constraint PK_VACCINE_DOCUMENTS primary key (VACCINE_ID, PET_ID)
)
go

/*==============================================================*/
/* Index: REFERENCES_FK                                         */
/*==============================================================*/
create index REFERENCES_FK on VACCINE_DOCUMENTS (
VACCINE_ID ASC
)
go

/*==============================================================*/
/* Index: IS_VACCINATED_WITH_FK                                 */
/*==============================================================*/
create index IS_VACCINATED_WITH_FK on VACCINE_DOCUMENTS (
PET_ID ASC
)
go

alter table ALLOWS
   add constraint FK_ALLOWS_ALLOWS_SESSIONS foreign key (SESSION_ID)
      references SESSIONS (SESSION_ID)
go

alter table ALLOWS
   add constraint FK_ALLOWS_ALLOWS2_BREEDS foreign key (BREED_ID)
      references BREEDS (BREED_ID)
go

alter table BEHAVES
   add constraint FK_BEHAVES_BEHAVES_TEMPERAM foreign key (TEMPERAMENT_ID)
      references TEMPERAMENTS (TEMPERAMENT_ID)
go

alter table BEHAVES
   add constraint FK_BEHAVES_BEHAVES2_PETS foreign key (PET_ID)
      references PETS (PET_ID)
go

alter table BOOKINGS
   add constraint FK_BOOKINGS_HAVE_PETS foreign key (PET_ID)
      references PETS (PET_ID)
go

alter table BOOKINGS
   add constraint FK_BOOKINGS_RESERVES__SESSIONS foreign key (SESSION_ID)
      references SESSIONS (SESSION_ID)
go

alter table BREEDS
   add constraint FK_BREEDS_BELONGS_T_SPECIES foreign key (SPECIES_ID)
      references SPECIES (SPECIES_ID)
go

alter table CHATS
   add constraint FK_CHATS_PARTICIPA_OWNERS foreign key (OWNER_ID)
      references OWNERS (USER_ID)
go

alter table CHATS
   add constraint FK_CHATS_PARTICIPA_SITTERS foreign key (SITTER_ID)
      references SITTERS (USER_ID)
go

alter table MESSAGES
   add constraint FK_MESSAGES_CONTAINS_CHATS foreign key (CHAT_ID)
      references CHATS (CHAT_ID)
go

alter table OWNERS
   add constraint FK_OWNERS_DESCRIBES_USERS foreign key (USER_ID)
      references USERS (USER_ID)
go

alter table PETS
   add constraint FK_PETS_IS_TYPE_O_BREEDS foreign key (BREED_ID)
      references BREEDS (BREED_ID)
go

alter table PETS
   add constraint FK_PETS_OWNS_OWNERS foreign key (USER_ID)
      references OWNERS (USER_ID)
go

alter table PREFERS
   add constraint FK_PREFERS_PREFERS_SITTERS foreign key (USER_ID)
      references SITTERS (USER_ID)
go

alter table PREFERS
   add constraint FK_PREFERS_PREFERS2_BREEDS foreign key (BREED_ID)
      references BREEDS (BREED_ID)
go

alter table SESSIONS
   add constraint FK_SESSIONS_GENERATES_TIME_SLO foreign key (SLOT_ID)
      references TIME_SLOTS (SLOT_ID)
go

alter table SITTERS
   add constraint FK_SITTERS_DESCRIBES_USERS foreign key (USER_ID)
      references USERS (USER_ID)
go

alter table SPECIALISES_IN
   add constraint FK_SPECIALI_SPECIALIS_SITTERS foreign key (USER_ID)
      references SITTERS (USER_ID)
go

alter table SPECIALISES_IN
   add constraint FK_SPECIALI_SPECIALIS_AREAS_EX foreign key (EXPERTISE_ID)
      references AREAS_EXPERTISE (EXPERTISE_ID)
go

alter table TIME_SLOTS
   add constraint FK_TIME_SLO_DEFINES_SITTERS foreign key (USER_ID)
      references SITTERS (USER_ID)
go

alter table TIME_SLOTS
   add constraint FK_TIME_SLO_RECURRS_I_RECURREN foreign key (RECURRENCE_ID)
      references RECURRENCE_TYPES (RECURRENCE_ID)
go

alter table VACCINE_DOCUMENTS
   add constraint FK_VACCINE__IS_VACCIN_PETS foreign key (PET_ID)
      references PETS (PET_ID)
go

alter table VACCINE_DOCUMENTS
   add constraint FK_VACCINE__REFERENCE_VACCINES foreign key (VACCINE_ID)
      references VACCINES (VACCINE_ID)
go

