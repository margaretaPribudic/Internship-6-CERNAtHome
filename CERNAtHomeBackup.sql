PGDMP                         z            CERNAtHomeNew    15.1    15.1 O    _           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            `           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            a           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            b           1262    16835    CERNAtHomeNew    DATABASE     ?   CREATE DATABASE "CERNAtHomeNew" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE "CERNAtHomeNew";
                postgres    false            ?            1259    16927    accelerators    TABLE     r   CREATE TABLE public.accelerators (
    acceleratorid integer NOT NULL,
    name character varying(30) NOT NULL
);
     DROP TABLE public.accelerators;
       public         heap    postgres    false            ?            1259    16926    accelerators_acceleratorid_seq    SEQUENCE     ?   CREATE SEQUENCE public.accelerators_acceleratorid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.accelerators_acceleratorid_seq;
       public          postgres    false    215            c           0    0    accelerators_acceleratorid_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.accelerators_acceleratorid_seq OWNED BY public.accelerators.acceleratorid;
          public          postgres    false    214            ?            1259    16940    acceleratorsprojects    TABLE     q   CREATE TABLE public.acceleratorsprojects (
    acceleratorid integer NOT NULL,
    projectid integer NOT NULL
);
 (   DROP TABLE public.acceleratorsprojects;
       public         heap    postgres    false            ?            1259    17079    cities    TABLE     z   CREATE TABLE public.cities (
    cityid integer NOT NULL,
    name character varying(30) NOT NULL,
    stateid integer
);
    DROP TABLE public.cities;
       public         heap    postgres    false            ?            1259    17078    cities_cityid_seq    SEQUENCE     ?   CREATE SEQUENCE public.cities_cityid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.cities_cityid_seq;
       public          postgres    false    226            d           0    0    cities_cityid_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.cities_cityid_seq OWNED BY public.cities.cityid;
          public          postgres    false    225            ?            1259    17091    hotels    TABLE     z   CREATE TABLE public.hotels (
    hotelid integer NOT NULL,
    name character varying(30) NOT NULL,
    cityid integer
);
    DROP TABLE public.hotels;
       public         heap    postgres    false            ?            1259    17090    hotels_hotelid_seq    SEQUENCE     ?   CREATE SEQUENCE public.hotels_hotelid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.hotels_hotelid_seq;
       public          postgres    false    228            e           0    0    hotels_hotelid_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.hotels_hotelid_seq OWNED BY public.hotels.hotelid;
          public          postgres    false    227            ?            1259    16968    professions    TABLE     M  CREATE TABLE public.professions (
    professionid integer NOT NULL,
    name character varying(30) NOT NULL,
    CONSTRAINT professionoptions CHECK (((name)::text = ANY ((ARRAY['programer'::character varying, 'fizičar'::character varying, 'inženjer'::character varying, 'znanstvenik materijala'::character varying])::text[])))
);
    DROP TABLE public.professions;
       public         heap    postgres    false            ?            1259    16967    professions_professionid_seq    SEQUENCE     ?   CREATE SEQUENCE public.professions_professionid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.professions_professionid_seq;
       public          postgres    false    222            f           0    0    professions_professionid_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.professions_professionid_seq OWNED BY public.professions.professionid;
          public          postgres    false    221            ?            1259    16934    projects    TABLE     j   CREATE TABLE public.projects (
    projectid integer NOT NULL,
    name character varying(30) NOT NULL
);
    DROP TABLE public.projects;
       public         heap    postgres    false            ?            1259    16933    projects_projectid_seq    SEQUENCE     ?   CREATE SEQUENCE public.projects_projectid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.projects_projectid_seq;
       public          postgres    false    217            g           0    0    projects_projectid_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.projects_projectid_seq OWNED BY public.projects.projectid;
          public          postgres    false    216            ?            1259    16956    scientificworks    TABLE     ?   CREATE TABLE public.scientificworks (
    scientificwork integer NOT NULL,
    name character varying(30) NOT NULL,
    dateofpublication timestamp without time zone,
    numberofquotes integer,
    projectid integer
);
 #   DROP TABLE public.scientificworks;
       public         heap    postgres    false            ?            1259    16955 "   scientificworks_scientificwork_seq    SEQUENCE     ?   CREATE SEQUENCE public.scientificworks_scientificwork_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.scientificworks_scientificwork_seq;
       public          postgres    false    220            h           0    0 "   scientificworks_scientificwork_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.scientificworks_scientificwork_seq OWNED BY public.scientificworks.scientificwork;
          public          postgres    false    219            ?            1259    17141 
   scientists    TABLE     .  CREATE TABLE public.scientists (
    scientistid integer NOT NULL,
    firstname character varying(30) NOT NULL,
    lastname character varying(30) NOT NULL,
    birthdate timestamp without time zone,
    sex character varying(30),
    stateid integer,
    professionid integer,
    hotelid integer
);
    DROP TABLE public.scientists;
       public         heap    postgres    false            ?            1259    17140    scientists_scientistid_seq    SEQUENCE     ?   CREATE SEQUENCE public.scientists_scientistid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.scientists_scientistid_seq;
       public          postgres    false    230            i           0    0    scientists_scientistid_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.scientists_scientistid_seq OWNED BY public.scientists.scientistid;
          public          postgres    false    229            ?            1259    17162    scientistsscientificwork    TABLE     z   CREATE TABLE public.scientistsscientificwork (
    scientistid integer NOT NULL,
    scientificworkid integer NOT NULL
);
 ,   DROP TABLE public.scientistsscientificwork;
       public         heap    postgres    false            ?            1259    16989    states    TABLE     ?   CREATE TABLE public.states (
    stateid integer NOT NULL,
    name character varying(30) NOT NULL,
    population integer,
    ppppercapita double precision
);
    DROP TABLE public.states;
       public         heap    postgres    false            ?            1259    16988    states_stateid_seq    SEQUENCE     ?   CREATE SEQUENCE public.states_stateid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.states_stateid_seq;
       public          postgres    false    224            j           0    0    states_stateid_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.states_stateid_seq OWNED BY public.states.stateid;
          public          postgres    false    223            ?           2604    16930    accelerators acceleratorid    DEFAULT     ?   ALTER TABLE ONLY public.accelerators ALTER COLUMN acceleratorid SET DEFAULT nextval('public.accelerators_acceleratorid_seq'::regclass);
 I   ALTER TABLE public.accelerators ALTER COLUMN acceleratorid DROP DEFAULT;
       public          postgres    false    215    214    215            ?           2604    17082    cities cityid    DEFAULT     n   ALTER TABLE ONLY public.cities ALTER COLUMN cityid SET DEFAULT nextval('public.cities_cityid_seq'::regclass);
 <   ALTER TABLE public.cities ALTER COLUMN cityid DROP DEFAULT;
       public          postgres    false    226    225    226            ?           2604    17094    hotels hotelid    DEFAULT     p   ALTER TABLE ONLY public.hotels ALTER COLUMN hotelid SET DEFAULT nextval('public.hotels_hotelid_seq'::regclass);
 =   ALTER TABLE public.hotels ALTER COLUMN hotelid DROP DEFAULT;
       public          postgres    false    228    227    228            ?           2604    16971    professions professionid    DEFAULT     ?   ALTER TABLE ONLY public.professions ALTER COLUMN professionid SET DEFAULT nextval('public.professions_professionid_seq'::regclass);
 G   ALTER TABLE public.professions ALTER COLUMN professionid DROP DEFAULT;
       public          postgres    false    222    221    222            ?           2604    16937    projects projectid    DEFAULT     x   ALTER TABLE ONLY public.projects ALTER COLUMN projectid SET DEFAULT nextval('public.projects_projectid_seq'::regclass);
 A   ALTER TABLE public.projects ALTER COLUMN projectid DROP DEFAULT;
       public          postgres    false    216    217    217            ?           2604    16959    scientificworks scientificwork    DEFAULT     ?   ALTER TABLE ONLY public.scientificworks ALTER COLUMN scientificwork SET DEFAULT nextval('public.scientificworks_scientificwork_seq'::regclass);
 M   ALTER TABLE public.scientificworks ALTER COLUMN scientificwork DROP DEFAULT;
       public          postgres    false    219    220    220            ?           2604    17144    scientists scientistid    DEFAULT     ?   ALTER TABLE ONLY public.scientists ALTER COLUMN scientistid SET DEFAULT nextval('public.scientists_scientistid_seq'::regclass);
 E   ALTER TABLE public.scientists ALTER COLUMN scientistid DROP DEFAULT;
       public          postgres    false    229    230    230            ?           2604    16992    states stateid    DEFAULT     p   ALTER TABLE ONLY public.states ALTER COLUMN stateid SET DEFAULT nextval('public.states_stateid_seq'::regclass);
 =   ALTER TABLE public.states ALTER COLUMN stateid DROP DEFAULT;
       public          postgres    false    224    223    224            L          0    16927    accelerators 
   TABLE DATA           ;   COPY public.accelerators (acceleratorid, name) FROM stdin;
    public          postgres    false    215   ?_       O          0    16940    acceleratorsprojects 
   TABLE DATA           H   COPY public.acceleratorsprojects (acceleratorid, projectid) FROM stdin;
    public          postgres    false    218   :`       W          0    17079    cities 
   TABLE DATA           7   COPY public.cities (cityid, name, stateid) FROM stdin;
    public          postgres    false    226   r`       Y          0    17091    hotels 
   TABLE DATA           7   COPY public.hotels (hotelid, name, cityid) FROM stdin;
    public          postgres    false    228   ?`       S          0    16968    professions 
   TABLE DATA           9   COPY public.professions (professionid, name) FROM stdin;
    public          postgres    false    222   ?`       N          0    16934    projects 
   TABLE DATA           3   COPY public.projects (projectid, name) FROM stdin;
    public          postgres    false    217   Fa       Q          0    16956    scientificworks 
   TABLE DATA           m   COPY public.scientificworks (scientificwork, name, dateofpublication, numberofquotes, projectid) FROM stdin;
    public          postgres    false    220   ?a       [          0    17141 
   scientists 
   TABLE DATA           v   COPY public.scientists (scientistid, firstname, lastname, birthdate, sex, stateid, professionid, hotelid) FROM stdin;
    public          postgres    false    230   jb       \          0    17162    scientistsscientificwork 
   TABLE DATA           Q   COPY public.scientistsscientificwork (scientistid, scientificworkid) FROM stdin;
    public          postgres    false    231   nc       U          0    16989    states 
   TABLE DATA           I   COPY public.states (stateid, name, population, ppppercapita) FROM stdin;
    public          postgres    false    224   ?c       k           0    0    accelerators_acceleratorid_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.accelerators_acceleratorid_seq', 5, true);
          public          postgres    false    214            l           0    0    cities_cityid_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.cities_cityid_seq', 3, true);
          public          postgres    false    225            m           0    0    hotels_hotelid_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.hotels_hotelid_seq', 5, true);
          public          postgres    false    227            n           0    0    professions_professionid_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.professions_professionid_seq', 4, true);
          public          postgres    false    221            o           0    0    projects_projectid_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.projects_projectid_seq', 9, true);
          public          postgres    false    216            p           0    0 "   scientificworks_scientificwork_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.scientificworks_scientificwork_seq', 16, true);
          public          postgres    false    219            q           0    0    scientists_scientistid_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.scientists_scientistid_seq', 9, true);
          public          postgres    false    229            r           0    0    states_stateid_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.states_stateid_seq', 5, true);
          public          postgres    false    223            ?           2606    16932    accelerators accelerators_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.accelerators
    ADD CONSTRAINT accelerators_pkey PRIMARY KEY (acceleratorid);
 H   ALTER TABLE ONLY public.accelerators DROP CONSTRAINT accelerators_pkey;
       public            postgres    false    215            ?           2606    16944 .   acceleratorsprojects acceleratorsprojects_pkey 
   CONSTRAINT     ?   ALTER TABLE ONLY public.acceleratorsprojects
    ADD CONSTRAINT acceleratorsprojects_pkey PRIMARY KEY (acceleratorid, projectid);
 X   ALTER TABLE ONLY public.acceleratorsprojects DROP CONSTRAINT acceleratorsprojects_pkey;
       public            postgres    false    218    218            ?           2606    17084    cities cities_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (cityid);
 <   ALTER TABLE ONLY public.cities DROP CONSTRAINT cities_pkey;
       public            postgres    false    226            ?           2606    17096    hotels hotels_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.hotels
    ADD CONSTRAINT hotels_pkey PRIMARY KEY (hotelid);
 <   ALTER TABLE ONLY public.hotels DROP CONSTRAINT hotels_pkey;
       public            postgres    false    228            ?           2606    16973    professions professions_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.professions
    ADD CONSTRAINT professions_pkey PRIMARY KEY (professionid);
 F   ALTER TABLE ONLY public.professions DROP CONSTRAINT professions_pkey;
       public            postgres    false    222            ?           2606    16939    projects projects_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (projectid);
 @   ALTER TABLE ONLY public.projects DROP CONSTRAINT projects_pkey;
       public            postgres    false    217            ?           2606    16961 $   scientificworks scientificworks_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.scientificworks
    ADD CONSTRAINT scientificworks_pkey PRIMARY KEY (scientificwork);
 N   ALTER TABLE ONLY public.scientificworks DROP CONSTRAINT scientificworks_pkey;
       public            postgres    false    220            ?           2606    17146    scientists scientists_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.scientists
    ADD CONSTRAINT scientists_pkey PRIMARY KEY (scientistid);
 D   ALTER TABLE ONLY public.scientists DROP CONSTRAINT scientists_pkey;
       public            postgres    false    230            ?           2606    17166 6   scientistsscientificwork scientistsscientificwork_pkey 
   CONSTRAINT     ?   ALTER TABLE ONLY public.scientistsscientificwork
    ADD CONSTRAINT scientistsscientificwork_pkey PRIMARY KEY (scientistid, scientificworkid);
 `   ALTER TABLE ONLY public.scientistsscientificwork DROP CONSTRAINT scientistsscientificwork_pkey;
       public            postgres    false    231    231            ?           2606    16994    states states_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.states
    ADD CONSTRAINT states_pkey PRIMARY KEY (stateid);
 <   ALTER TABLE ONLY public.states DROP CONSTRAINT states_pkey;
       public            postgres    false    224            ?           2606    17182    cities uniquecity 
   CONSTRAINT     L   ALTER TABLE ONLY public.cities
    ADD CONSTRAINT uniquecity UNIQUE (name);
 ;   ALTER TABLE ONLY public.cities DROP CONSTRAINT uniquecity;
       public            postgres    false    226            ?           2606    17178    professions uniquename 
   CONSTRAINT     Q   ALTER TABLE ONLY public.professions
    ADD CONSTRAINT uniquename UNIQUE (name);
 @   ALTER TABLE ONLY public.professions DROP CONSTRAINT uniquename;
       public            postgres    false    222            ?           2606    17180    states uniquestate 
   CONSTRAINT     M   ALTER TABLE ONLY public.states
    ADD CONSTRAINT uniquestate UNIQUE (name);
 <   ALTER TABLE ONLY public.states DROP CONSTRAINT uniquestate;
       public            postgres    false    224            ?           2606    16945 <   acceleratorsprojects acceleratorsprojects_acceleratorid_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.acceleratorsprojects
    ADD CONSTRAINT acceleratorsprojects_acceleratorid_fkey FOREIGN KEY (acceleratorid) REFERENCES public.accelerators(acceleratorid);
 f   ALTER TABLE ONLY public.acceleratorsprojects DROP CONSTRAINT acceleratorsprojects_acceleratorid_fkey;
       public          postgres    false    3226    218    215            ?           2606    16950 8   acceleratorsprojects acceleratorsprojects_projectid_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.acceleratorsprojects
    ADD CONSTRAINT acceleratorsprojects_projectid_fkey FOREIGN KEY (projectid) REFERENCES public.projects(projectid);
 b   ALTER TABLE ONLY public.acceleratorsprojects DROP CONSTRAINT acceleratorsprojects_projectid_fkey;
       public          postgres    false    217    218    3228            ?           2606    17085    cities cities_stateid_fkey    FK CONSTRAINT        ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_stateid_fkey FOREIGN KEY (stateid) REFERENCES public.states(stateid);
 D   ALTER TABLE ONLY public.cities DROP CONSTRAINT cities_stateid_fkey;
       public          postgres    false    226    3238    224            ?           2606    17097    hotels hotels_cityid_fkey    FK CONSTRAINT     |   ALTER TABLE ONLY public.hotels
    ADD CONSTRAINT hotels_cityid_fkey FOREIGN KEY (cityid) REFERENCES public.cities(cityid);
 C   ALTER TABLE ONLY public.hotels DROP CONSTRAINT hotels_cityid_fkey;
       public          postgres    false    3242    228    226            ?           2606    16962 .   scientificworks scientificworks_projectid_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.scientificworks
    ADD CONSTRAINT scientificworks_projectid_fkey FOREIGN KEY (projectid) REFERENCES public.projects(projectid);
 X   ALTER TABLE ONLY public.scientificworks DROP CONSTRAINT scientificworks_projectid_fkey;
       public          postgres    false    220    3228    217            ?           2606    17157 "   scientists scientists_hotelid_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.scientists
    ADD CONSTRAINT scientists_hotelid_fkey FOREIGN KEY (hotelid) REFERENCES public.hotels(hotelid);
 L   ALTER TABLE ONLY public.scientists DROP CONSTRAINT scientists_hotelid_fkey;
       public          postgres    false    230    228    3246            ?           2606    17152 '   scientists scientists_professionid_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.scientists
    ADD CONSTRAINT scientists_professionid_fkey FOREIGN KEY (professionid) REFERENCES public.professions(professionid);
 Q   ALTER TABLE ONLY public.scientists DROP CONSTRAINT scientists_professionid_fkey;
       public          postgres    false    230    222    3234            ?           2606    17147 "   scientists scientists_stateid_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.scientists
    ADD CONSTRAINT scientists_stateid_fkey FOREIGN KEY (stateid) REFERENCES public.states(stateid);
 L   ALTER TABLE ONLY public.scientists DROP CONSTRAINT scientists_stateid_fkey;
       public          postgres    false    3238    224    230            ?           2606    17172 G   scientistsscientificwork scientistsscientificwork_scientificworkid_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.scientistsscientificwork
    ADD CONSTRAINT scientistsscientificwork_scientificworkid_fkey FOREIGN KEY (scientificworkid) REFERENCES public.scientificworks(scientificwork);
 q   ALTER TABLE ONLY public.scientistsscientificwork DROP CONSTRAINT scientistsscientificwork_scientificworkid_fkey;
       public          postgres    false    3232    231    220            ?           2606    17167 B   scientistsscientificwork scientistsscientificwork_scientistid_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.scientistsscientificwork
    ADD CONSTRAINT scientistsscientificwork_scientistid_fkey FOREIGN KEY (scientistid) REFERENCES public.scientists(scientistid);
 l   ALTER TABLE ONLY public.scientistsscientificwork DROP CONSTRAINT scientistsscientificwork_scientistid_fkey;
       public          postgres    false    231    3248    230            L   /   x?3?t?NN?I-J,?/2?2B?q#s??L??&\??\S?=... ?'      O   (   x?3?4?2?4?2?4b.cNS 6?2?4b?=... Uy      W   ,   x?3?<?75/?,?Ӑˈӯ2??0????+)J-? rb???? ?
?      Y   0   x?3???/I?1?4?2?0??Lc??4?0M8??L!LSNc?=... ?,      S   H   x?3?,(?O/J?M-?2?Lˬ?<қX?e̙?wt_j^P؄?*/1???,5/3[!7?$?(3+1'?+F??? 	??      N   ;   x?5ƻ  E??F???j($b??ީ?3??5?sx??@T#IMd5S?BU+Mm|{??      Q   ?   x?u?A
?@????@%?әi=??)??M*?ߤ?	?,?'???????/??9?:$ap?????뤜@??????T?fO??귖$4x:??KP<-F[?h??Օ?e??<mFGVK???F'OK*4y:?=?_?????N!-?5&???04/Be??cTM?P?5?ڠ?E?֛h?e?Cq(?!T?z?y?뉈????%      [   ?   x?u?MN?0F?ߜ??ILv^T???T?lS,?*j$׮8a?{1nAH?h?Y?y?f\j??*s!??ٍ??????????AAQ?Φ~?fE&????]?y.ʱ??q?????????v???Z?鐧?fp?0/??w<1???zc??"}??ѻ??LWWмBFw??֢???$????r???Y??2J??UqnE%1z??x8?I]N??|
RP????8?'?L?+QXMϷD??ye#      \   @   x??? 1?PL?Pc/??,?&??????a???<??J~)|WRP???z???H>?f
N      U   }   x?%˻?0 ?ZF'[?e-?A?	ht9??OaB????????^?????P?Ufe?H??m???T?N8*(0̗??[o?;?h?T1???c|?X4?SU)a????iv????`??L????#`     