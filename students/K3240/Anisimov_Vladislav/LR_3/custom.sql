PGDMP  '    $                }            carRent    16.2    16.2 L    4           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            5           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            6           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            7           1262    16398    carRent    DATABASE     }   CREATE DATABASE "carRent" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE "carRent";
                postgres    false            k           1247    16555 	   fuel_type    TYPE     ~   CREATE TYPE public.fuel_type AS ENUM (
    'petrol',
    'diesel',
    'electro',
    'АИ-95',
    'АИ-98',
    'ДТ'
);
    DROP TYPE public.fuel_type;
       public          postgres    false            �           1247    16747    insurance_type    TYPE     \   CREATE TYPE public.insurance_type AS ENUM (
    'Полная',
    'Частичная'
);
 !   DROP TYPE public.insurance_type;
       public          postgres    false            e           1247    16536    transmission_type    TYPE     y   CREATE TYPE public.transmission_type AS ENUM (
    'auto',
    'manual',
    'variator',
    'electro',
    'robotic'
);
 $   DROP TYPE public.transmission_type;
       public          postgres    false            �            1259    16593    accident    TABLE     �   CREATE TABLE public.accident (
    id integer NOT NULL,
    instance_id integer NOT NULL,
    damage real NOT NULL,
    date timestamp with time zone NOT NULL,
    place text NOT NULL
);
    DROP TABLE public.accident;
       public         heap    postgres    false            �            1259    16492    brand    TABLE     �   CREATE TABLE public.brand (
    id integer NOT NULL,
    name text NOT NULL,
    insurance_type public.insurance_type NOT NULL,
    insurance_cost real NOT NULL,
    collateral_value real NOT NULL
);
    DROP TABLE public.brand;
       public         heap    postgres    false    905            �            1259    16528    car    TABLE     �   CREATE TABLE public.car (
    id integer NOT NULL,
    engine_id integer NOT NULL,
    transmission public.transmission_type NOT NULL,
    car_body_id integer NOT NULL,
    fuel_consumption real NOT NULL,
    info_id integer
);
    DROP TABLE public.car;
       public         heap    postgres    false    869            �            1259    16561    car_body    TABLE     �   CREATE TABLE public.car_body (
    id integer NOT NULL,
    clearence integer NOT NULL,
    trunk_volume integer NOT NULL,
    seats_count integer NOT NULL
);
    DROP TABLE public.car_body;
       public         heap    postgres    false            �            1259    16511    car_info    TABLE     �   CREATE TABLE public.car_info (
    id integer NOT NULL,
    brand_id integer NOT NULL,
    model text NOT NULL,
    description text NOT NULL
);
    DROP TABLE public.car_info;
       public         heap    postgres    false            �            1259    16581    car_instance    TABLE     :  CREATE TABLE public.car_instance (
    id integer NOT NULL,
    car_id integer NOT NULL,
    reg_code text NOT NULL,
    vin_code text NOT NULL,
    special_marks text,
    engine_code text NOT NULL,
    last_maintenance date,
    price integer NOT NULL,
    mileage integer NOT NULL,
    year integer NOT NULL
);
     DROP TABLE public.car_instance;
       public         heap    postgres    false            �            1259    16479    client    TABLE       CREATE TABLE public.client (
    id integer NOT NULL,
    full_name text NOT NULL,
    phone text NOT NULL,
    adress text NOT NULL,
    discount real,
    CONSTRAINT discount_check CHECK (((discount > (0)::double precision) AND (discount <= (1)::double precision)))
);
    DROP TABLE public.client;
       public         heap    postgres    false            �            1259    16616    contract    TABLE     K  CREATE TABLE public.contract (
    id integer NOT NULL,
    instance_id integer NOT NULL,
    passport_id integer NOT NULL,
    price real NOT NULL,
    date_start timestamp with time zone NOT NULL,
    rent_scan_ref text,
    rent_emp_id integer NOT NULL,
    return_scan_ref text,
    return_emp_id integer,
    delay integer
);
    DROP TABLE public.contract;
       public         heap    postgres    false            �            1259    16664    contract_history    TABLE     �   CREATE TABLE public.contract_history (
    id integer NOT NULL,
    contract_id integer NOT NULL,
    emp_id integer NOT NULL,
    date_end time with time zone NOT NULL
);
 $   DROP TABLE public.contract_history;
       public         heap    postgres    false            �            1259    16445    employee    TABLE     �   CREATE TABLE public.employee (
    id integer NOT NULL,
    full_name text NOT NULL,
    phone_number text NOT NULL,
    email text NOT NULL
);
    DROP TABLE public.employee;
       public         heap    postgres    false            �            1259    16547    engine    TABLE     �   CREATE TABLE public.engine (
    id integer NOT NULL,
    capacity real NOT NULL,
    power integer NOT NULL,
    fuel_type public.fuel_type NOT NULL
);
    DROP TABLE public.engine;
       public         heap    postgres    false    875            �            1259    16603    fine    TABLE     �   CREATE TABLE public.fine (
    id integer NOT NULL,
    instance_id integer NOT NULL,
    info text NOT NULL,
    cost integer NOT NULL,
    date timestamp with time zone NOT NULL,
    client_pays boolean DEFAULT true NOT NULL
);
    DROP TABLE public.fine;
       public         heap    postgres    false            �            1259    16470    passport_history    TABLE     &  CREATE TABLE public.passport_history (
    id integer NOT NULL,
    client_id integer NOT NULL,
    date_start date NOT NULL,
    date_end date,
    details text NOT NULL,
    CONSTRAINT date_check CHECK ((date_start < date_end)),
    CONSTRAINT details_check CHECK ((details <> ' '::text))
);
 $   DROP TABLE public.passport_history;
       public         heap    postgres    false            �            1259    16399    position    TABLE     y   CREATE TABLE public."position" (
    id integer NOT NULL,
    title text NOT NULL,
    responsibilities text NOT NULL
);
    DROP TABLE public."position";
       public         heap    postgres    false            �            1259    16415    positions_history    TABLE     �   CREATE TABLE public.positions_history (
    id integer NOT NULL,
    emp_pos_id integer NOT NULL,
    emp_id integer NOT NULL,
    salary integer NOT NULL,
    date_start date NOT NULL,
    date_end date
);
 %   DROP TABLE public.positions_history;
       public         heap    postgres    false            .          0    16593    accident 
   TABLE DATA           H   COPY public.accident (id, instance_id, damage, date, place) FROM stdin;
    public          postgres    false    226   �`       (          0    16492    brand 
   TABLE DATA           [   COPY public.brand (id, name, insurance_type, insurance_cost, collateral_value) FROM stdin;
    public          postgres    false    220   �a       *          0    16528    car 
   TABLE DATA           b   COPY public.car (id, engine_id, transmission, car_body_id, fuel_consumption, info_id) FROM stdin;
    public          postgres    false    222   ~b       ,          0    16561    car_body 
   TABLE DATA           L   COPY public.car_body (id, clearence, trunk_volume, seats_count) FROM stdin;
    public          postgres    false    224   �c       )          0    16511    car_info 
   TABLE DATA           D   COPY public.car_info (id, brand_id, model, description) FROM stdin;
    public          postgres    false    221   xd       -          0    16581    car_instance 
   TABLE DATA           �   COPY public.car_instance (id, car_id, reg_code, vin_code, special_marks, engine_code, last_maintenance, price, mileage, year) FROM stdin;
    public          postgres    false    225   �f       '          0    16479    client 
   TABLE DATA           H   COPY public.client (id, full_name, phone, adress, discount) FROM stdin;
    public          postgres    false    219   �i       0          0    16616    contract 
   TABLE DATA           �   COPY public.contract (id, instance_id, passport_id, price, date_start, rent_scan_ref, rent_emp_id, return_scan_ref, return_emp_id, delay) FROM stdin;
    public          postgres    false    228   �v       1          0    16664    contract_history 
   TABLE DATA           M   COPY public.contract_history (id, contract_id, emp_id, date_end) FROM stdin;
    public          postgres    false    229   u�       %          0    16445    employee 
   TABLE DATA           F   COPY public.employee (id, full_name, phone_number, email) FROM stdin;
    public          postgres    false    217   ��       +          0    16547    engine 
   TABLE DATA           @   COPY public.engine (id, capacity, power, fuel_type) FROM stdin;
    public          postgres    false    223   f�       /          0    16603    fine 
   TABLE DATA           N   COPY public.fine (id, instance_id, info, cost, date, client_pays) FROM stdin;
    public          postgres    false    227   A�       &          0    16470    passport_history 
   TABLE DATA           X   COPY public.passport_history (id, client_id, date_start, date_end, details) FROM stdin;
    public          postgres    false    218   ��       #          0    16399    position 
   TABLE DATA           A   COPY public."position" (id, title, responsibilities) FROM stdin;
    public          postgres    false    215   ;�       $          0    16415    positions_history 
   TABLE DATA           a   COPY public.positions_history (id, emp_pos_id, emp_id, salary, date_start, date_end) FROM stdin;
    public          postgres    false    216   ;�       c           2606    16777    accident accident_damage_check    CHECK CONSTRAINT     z   ALTER TABLE public.accident
    ADD CONSTRAINT accident_damage_check CHECK ((damage >= (0)::double precision)) NOT VALID;
 C   ALTER TABLE public.accident DROP CONSTRAINT accident_damage_check;
       public          postgres    false    226    226            }           2606    16597    accident accident_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.accident
    ADD CONSTRAINT accident_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.accident DROP CONSTRAINT accident_pkey;
       public            postgres    false    226            q           2606    16498    brand brand_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.brand
    ADD CONSTRAINT brand_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.brand DROP CONSTRAINT brand_pkey;
       public            postgres    false    220            y           2606    16565    car_body car_body_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.car_body
    ADD CONSTRAINT car_body_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.car_body DROP CONSTRAINT car_body_pkey;
       public            postgres    false    224            s           2606    16517    car_info car_info_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.car_info
    ADD CONSTRAINT car_info_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.car_info DROP CONSTRAINT car_info_pkey;
       public            postgres    false    221            a           2606    16701 '   car_instance car_instance_mileage_check    CHECK CONSTRAINT     p   ALTER TABLE public.car_instance
    ADD CONSTRAINT car_instance_mileage_check CHECK ((mileage >= 0)) NOT VALID;
 L   ALTER TABLE public.car_instance DROP CONSTRAINT car_instance_mileage_check;
       public          postgres    false    225    225            {           2606    16587    car_instance car_instance_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.car_instance
    ADD CONSTRAINT car_instance_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.car_instance DROP CONSTRAINT car_instance_pkey;
       public            postgres    false    225            b           2606    16700 %   car_instance car_instance_price_check    CHECK CONSTRAINT     k   ALTER TABLE public.car_instance
    ADD CONSTRAINT car_instance_price_check CHECK ((price > 0)) NOT VALID;
 J   ALTER TABLE public.car_instance DROP CONSTRAINT car_instance_price_check;
       public          postgres    false    225    225            [           2606    16426    positions_history check_date    CHECK CONSTRAINT     o   ALTER TABLE public.positions_history
    ADD CONSTRAINT check_date CHECK ((date_start <= date_end)) NOT VALID;
 A   ALTER TABLE public.positions_history DROP CONSTRAINT check_date;
       public          postgres    false    216    216    216    216            \           2606    16425    positions_history check_salary    CHECK CONSTRAINT     f   ALTER TABLE public.positions_history
    ADD CONSTRAINT check_salary CHECK ((salary >= 0)) NOT VALID;
 C   ALTER TABLE public.positions_history DROP CONSTRAINT check_salary;
       public          postgres    false    216    216            o           2606    16486    client client_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.client DROP CONSTRAINT client_pkey;
       public            postgres    false    219            �           2606    16759 &   contract_history contract_history_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.contract_history
    ADD CONSTRAINT contract_history_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.contract_history DROP CONSTRAINT contract_history_pkey;
       public            postgres    false    229            �           2606    16620    contract contract_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.contract
    ADD CONSTRAINT contract_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.contract DROP CONSTRAINT contract_pkey;
       public            postgres    false    228            g           2606    16403    position emp_position_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public."position"
    ADD CONSTRAINT emp_position_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public."position" DROP CONSTRAINT emp_position_pkey;
       public            postgres    false    215            i           2606    16419 ,   positions_history emp_positions_history_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.positions_history
    ADD CONSTRAINT emp_positions_history_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.positions_history DROP CONSTRAINT emp_positions_history_pkey;
       public            postgres    false    216            k           2606    16451    employee employee_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.employee DROP CONSTRAINT employee_pkey;
       public            postgres    false    217            w           2606    16553    engine engine_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.engine
    ADD CONSTRAINT engine_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.engine DROP CONSTRAINT engine_pkey;
       public            postgres    false    223            d           2606    16702    fine fine_cost_check    CHECK CONSTRAINT     Y   ALTER TABLE public.fine
    ADD CONSTRAINT fine_cost_check CHECK ((cost > 0)) NOT VALID;
 9   ALTER TABLE public.fine DROP CONSTRAINT fine_cost_check;
       public          postgres    false    227    227                       2606    16609    fine fine_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.fine
    ADD CONSTRAINT fine_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.fine DROP CONSTRAINT fine_pkey;
       public            postgres    false    227            m           2606    16705 &   passport_history passport_history_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.passport_history
    ADD CONSTRAINT passport_history_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.passport_history DROP CONSTRAINT passport_history_pkey;
       public            postgres    false    218            `           2606    16694    engine power_check    CHECK CONSTRAINT     X   ALTER TABLE public.engine
    ADD CONSTRAINT power_check CHECK ((power > 0)) NOT VALID;
 7   ALTER TABLE public.engine DROP CONSTRAINT power_check;
       public          postgres    false    223    223            e           2606    16770    contract price_check    CHECK CONSTRAINT     n   ALTER TABLE public.contract
    ADD CONSTRAINT price_check CHECK ((price > (0)::double precision)) NOT VALID;
 9   ALTER TABLE public.contract DROP CONSTRAINT price_check;
       public          postgres    false    228    228            u           2606    16534    car specs_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.car
    ADD CONSTRAINT specs_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.car DROP CONSTRAINT specs_pkey;
       public            postgres    false    222            �           2606    16598 "   accident accident_instance_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.accident
    ADD CONSTRAINT accident_instance_id_fkey FOREIGN KEY (instance_id) REFERENCES public.car_instance(id);
 L   ALTER TABLE ONLY public.accident DROP CONSTRAINT accident_instance_id_fkey;
       public          postgres    false    225    4731    226            �           2606    16518    car_info car_info_brand_id_fkey    FK CONSTRAINT        ALTER TABLE ONLY public.car_info
    ADD CONSTRAINT car_info_brand_id_fkey FOREIGN KEY (brand_id) REFERENCES public.brand(id);
 I   ALTER TABLE ONLY public.car_info DROP CONSTRAINT car_info_brand_id_fkey;
       public          postgres    false    221    220    4721            �           2606    16654 %   car_instance car_instance_car_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.car_instance
    ADD CONSTRAINT car_instance_car_id_fkey FOREIGN KEY (car_id) REFERENCES public.car(id) NOT VALID;
 O   ALTER TABLE ONLY public.car_instance DROP CONSTRAINT car_instance_car_id_fkey;
       public          postgres    false    222    225    4725            �           2606    16760 2   contract_history contract_history_contract_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.contract_history
    ADD CONSTRAINT contract_history_contract_id_fkey FOREIGN KEY (contract_id) REFERENCES public.contract(id) NOT VALID;
 \   ALTER TABLE ONLY public.contract_history DROP CONSTRAINT contract_history_contract_id_fkey;
       public          postgres    false    4737    229    228            �           2606    16765 -   contract_history contract_history_emp_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.contract_history
    ADD CONSTRAINT contract_history_emp_id_fkey FOREIGN KEY (emp_id) REFERENCES public.employee(id) NOT VALID;
 W   ALTER TABLE ONLY public.contract_history DROP CONSTRAINT contract_history_emp_id_fkey;
       public          postgres    false    217    229    4715            �           2606    16684 "   contract contract_instance_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.contract
    ADD CONSTRAINT contract_instance_id_fkey FOREIGN KEY (instance_id) REFERENCES public.car_instance(id) NOT VALID;
 L   ALTER TABLE ONLY public.contract DROP CONSTRAINT contract_instance_id_fkey;
       public          postgres    false    225    228    4731            �           2606    16753 "   contract contract_passport_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.contract
    ADD CONSTRAINT contract_passport_id_fkey FOREIGN KEY (passport_id) REFERENCES public.passport_history(id) NOT VALID;
 L   ALTER TABLE ONLY public.contract DROP CONSTRAINT contract_passport_id_fkey;
       public          postgres    false    228    4717    218            �           2606    16785 "   contract contract_rent_emp_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.contract
    ADD CONSTRAINT contract_rent_emp_id_fkey FOREIGN KEY (rent_emp_id) REFERENCES public.employee(id) NOT VALID;
 L   ALTER TABLE ONLY public.contract DROP CONSTRAINT contract_rent_emp_id_fkey;
       public          postgres    false    217    228    4715            �           2606    16790 $   contract contract_return_emp_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.contract
    ADD CONSTRAINT contract_return_emp_id_fkey FOREIGN KEY (return_emp_id) REFERENCES public.employee(id) NOT VALID;
 N   ALTER TABLE ONLY public.contract DROP CONSTRAINT contract_return_emp_id_fkey;
       public          postgres    false    4715    217    228            �           2606    16420    positions_history emp_pos_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.positions_history
    ADD CONSTRAINT emp_pos_id FOREIGN KEY (emp_pos_id) REFERENCES public."position"(id);
 F   ALTER TABLE ONLY public.positions_history DROP CONSTRAINT emp_pos_id;
       public          postgres    false    216    215    4711            �           2606    16610    fine fine_instance_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.fine
    ADD CONSTRAINT fine_instance_id_fkey FOREIGN KEY (instance_id) REFERENCES public.car_instance(id);
 D   ALTER TABLE ONLY public.fine DROP CONSTRAINT fine_instance_id_fkey;
       public          postgres    false    225    227    4731            �           2606    16487 0   passport_history passport_history_client_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.passport_history
    ADD CONSTRAINT passport_history_client_id_fkey FOREIGN KEY (client_id) REFERENCES public.client(id) NOT VALID;
 Z   ALTER TABLE ONLY public.passport_history DROP CONSTRAINT passport_history_client_id_fkey;
       public          postgres    false    218    219    4719            �           2606    16689 /   positions_history positions_history_emp_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.positions_history
    ADD CONSTRAINT positions_history_emp_id_fkey FOREIGN KEY (emp_id) REFERENCES public.employee(id) NOT VALID;
 Y   ALTER TABLE ONLY public.positions_history DROP CONSTRAINT positions_history_emp_id_fkey;
       public          postgres    false    4715    216    217            �           2606    16571    car specs_car_body_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.car
    ADD CONSTRAINT specs_car_body_id_fkey FOREIGN KEY (car_body_id) REFERENCES public.car_body(id) NOT VALID;
 D   ALTER TABLE ONLY public.car DROP CONSTRAINT specs_car_body_id_fkey;
       public          postgres    false    222    4729    224            �           2606    16576    car specs_engine_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.car
    ADD CONSTRAINT specs_engine_id_fkey FOREIGN KEY (engine_id) REFERENCES public.engine(id) NOT VALID;
 B   ALTER TABLE ONLY public.car DROP CONSTRAINT specs_engine_id_fkey;
       public          postgres    false    222    4727    223            �           2606    16649    car specs_info_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.car
    ADD CONSTRAINT specs_info_id_fkey FOREIGN KEY (info_id) REFERENCES public.car_info(id) NOT VALID;
 @   ALTER TABLE ONLY public.car DROP CONSTRAINT specs_info_id_fkey;
       public          postgres    false    4723    222    221            .   �   x�u��m�0�3U���\DR���:B���) ��/��Y+HX�����žX��U@ �S��H�B���~y@`��\��v^��(JpZ���8>��dߜ��'����j�0rR�2�Xo	����M�eNX��V�o�c�n[�[������hQT�s[禎���ܦ�oeIA I73�����tҮ>[vc�82GG�iB�nfl�����]o&=>����u��F�E��K�-]:�?�1�/�[�      (   �   x�3�ɯ�/I�0�¾�/콰�b?��p�I.#N������@�ƋMv\l�*�@�2�t�G5�l�	��2��M-JNMI-�uJͫ�f�rSN�ҔLB��8��s����S���˜�-�(����,8�3Rˊ�sRKxԒӣ���6��U��eh�靉5����qqq �U�      *   $  x�E�Mj�0�ףØH��K7iW�B^��Qb' |��3R��}l��Рb�	z0����u�Ƕ�%LH�(�4���Y��7Oo3)(ط��x}�-�NVQ�2_Ȉ��.PNQ:�*T�.`���W'Q��;QvD�������"Xӳ/�&��U*�>ik��ȣ�fs:CQZ1(*!9���s���CGWEZ�blr�2���:(J�E�юPT�qM,�F*�E5g	��<54F���:=RB+�;�����
֭��2���v7{(~�*G*�|��q��[����#��?�ʁ{      ,   �   x�-���0C��0=�e�]����~ؑ�H"*�)Q��2�K\��S�����b��ήo�Ɏ��d�:|����7fP�V�ū�uIdK)�������?�ِCg���y�]�1�oL��`g��R�sb!��u!�tB�V#D�#C����=[���y��������;��Z�u~64      )   ]  x�uTˊQ]WE�@d2��c)A݋nLPp�D�d���:�v����B�?򜺷3{ :�V�:uNU�R�V���+����}�?�qc�c7�T8��:�L�u���t�+M� �	�b�.t��h��nh�k&'+���X�X�Lә���Y }FHCȣC9�V�e�\�+���2@��pWj���w�`��¨�܄̀\এ>�x6�ʲ�Ds�ɑ<n��DFƽ/�I�*�7�B�.�k�r<"�c+��!�	+����@ �"nR����Ph6�iHC��Z�^O�7�J�h��Ͼ{��̍��=	�A2g7����SDE#�ǎ.��YԔ��m�~!Mr�vUC���l��9CmT2J8X������䊎�Xt/�b �kb��3�?rWnS�����3��B�r�h@jA�|�Y�G*$��щ���Z�y �}gl�ҕE2�s���eF�uK�Q1��)y�����ϵBê�&ѩ�r�ڗ]�of6����Pn�T��y�y�������ɣ��s�_+�
K�g8��h���D����m�t@��#-7=$M��?��~ �<�t9c����^���-��/'v6����0;qo�Z=�E�_ճC�      -   �  x�e��n�0�דw���qb/H��Q�A}(�Ħj�^���#��@ҰA��/�_���;�T��N��}[H֊���:��e�]EO1m���S�B��`����R�N$��N��;�/bvY[k>XX�g:U�,׻R�R�u�Pd�D
H=L@va�D����M��	zȷs�+yJcC����ŭ�dN9�	L}a�I

ܙ���{e�����8e�v�.ꇧ��b"	�����4��^i$���X|;U쨙?C��Z椲���Ϊ�����|Hotֽ�w��<�ȼ
H�'���E<���QH9� �Y��>X����=C]�.*r@�+��䵾�d8�:�>�'k��C��@�a���[�R=
�RJ����t?,~��L��"����*�1�ҫv*���#^�YB>�:�i��/�/�C����ou�;��N��N�����]�vG�_.=R,2��6��u;��)0��	��>��2��=L<�>��i`�`�
G}"C�P��L����g�Pҕ��*�ז�֋Q�0�t��>�>u�:�tݻK��q6m������������Ч��'ާ�ߧC�	5����V�P���D#�QMI<����t����7��Mo�n=�߹ȧ�j�S�iIM�Q��H�/7�8H�m�B)��M'�ǺZ��ܲ��|V"�'�j��]�$���N�      '   (  x�]X�R�H|���z��!G�T��'n�10f�b6���.����X��|��)5���a(չ���S��w��3���^��N�[)��Wn�.�(=ӥr%�{�f�R�W~��kܱ��>S���v�m|���*��[��;-
+�fR*�O���Y�n�󓪛�"ָ<mb�$~�nھ��7o����W�9Y���+~�Ū�s���m�;���\VmS�o���J�ۺ��V3��GMS��n����<_\��:6~9�ꄠ�G��:�#�g�'�}j$��u�wM�k~_m���(��_�_�r�p��<��$�s��g�U����?i����Q.��l�å*�3�~�T�~����{�G�!֋��7��N(Up����+������66�*6�V)�Q��"�J�dߌh�D�Z�B��/�����'%���,��"-��H�
f�l!���:����uU�����'����.5��mR�Q��q9�J[[c<�$ֻ�mK�y���a��հA��{�Ơ����J�/�[�� _�/P�|�d?ڎ�+uH���+�M�J��+WX�O����x~���a,�eG�J~5̫�Ǳ����
�e�H��D�����IЎ��u��@���J�J�
�a����'�?� �|ڣR�5��f�I�T8�)�՘�/��"!��e`�q�y�+�{�U7ΰ�MV�PVf5��f���P.%�uZ���nA�*]Q�S���4L��P9i��.�LIv��u�~�^�\�l��d!ZoK~=��)(�"D�0�g��j�o��ن �t�Tग�Q#��]��Y` ��4��)[A�F�bj����BV��(��z;�P�/H�t#��O;��V	�bxn�v����_�z� /��(�bHՀᤶ��H������G ё-��"��"�#�Y;D� D�ħ��;��jˏ�����sY�� ���L���
B�(Xs����`�kT���e���Kdy������~������~�,Q�5t�-��L�޺���;$���؁0�ݲ�/�U����B�#���8p���6>E��"�Ո|Ea�RB0��ԯ��L����uU��g�kJ��	IҘ|Lx-4��f��>e��\������5j�����V�"� Y�u� kL�Ov>��	�����ҡfJ�1��A�V�V�ݯ�߶���TV�8�
X6�`Fd�8�5
M�)l��4t���1u}ڂ|��Eٵ�H n����_�S~G^��"8�g·Z F��N�^�B��d1��Ñd;t}_H
��DiqHCB���5@�@���̒4��$"����ұ<G��,It�ϻ�>ː���~�R����{f���3"�c�;��I{���5	����XE�U �{�p�E[��+���	.Mɮ�6�)a�S�ˠ� l� 
��Xx^�g�C�.�m��_�c�r�`p6��ߐ�V[j��e���<����@*S�1n/p�\hS��X�f9�,B����}��W���Β�94������ЌC��`(~3���f3Z�Q�+���~Ue��Sr)�)�Mk@|�����O�G9Qj�QmP�Ev{U*� J=h[�<�$_�a�`8�GJ� |�g��-���=z$WR;<Ni@�VY~��3y҉�3�"[ �n$�y�(RQ��,x�*�3��k*�+5�O.1�2�X�{n��U8�,� �Um����\g]?N�k�gf��l�p�`	��3'lW�V:vR���U�u�l߇�$�S�	N�<Ck�il�0���t �`��@��S͌��-�DC��	d�_�����T	�����4K=��`'���^I�Z��NZ`(��:�$�AJ"d�$��"@���١��"������V��U�N����\�Ys�Kɯa���Cݭb�`�$��\���0� 0A�����`��@Y>��q�6o�n�Q7���#P)$+D���f�s	<�T��=B:1���
"1���"��`��i���K����*�8���b�#A�Bb�J�u��A�㵀�
�n�X��D;z-�W�% ��r�T��Dp�gg�Ζ��e5
]�I*�)l	�;o1�[����βk;�����(ED*$SZ���u����b	K!����>c���s(vL�����$! \�A���"��;���3��p6�� �	��V`Rn�AR���C�z��H(3�9��d��U�P�zH�'�Q�'�;b�mW���=��Lv(����y������`����� `@������	�G�aw�#;b�C�6���b��R���1��uMa?�=�����8�~U�2�Z0p;J#�7mnu	��$�b=E��%R���^�K��i�� =��Q���6~��m�S�Z���vibjE�-��é�XA����s_5l}��L[gI�K�.,!@ʄ�S[�&˶dĚ�z%��|�������+��m�"�d�]�~r��쏪;��2Y	�Ú�``�������QSM��z>В��J{z�x�ۍ����"{�i�|ɎI�b��i�UH�K)�C�,��p�9L�^R�Ώ	s��Լ?�(K�`'%>j��
��kީ	� �e�:�"��-]6Y���y(/�W���\|���T�M�	�B�d������9 �`E�/�z3�%0�X���qt���E� �H9z�Iw���`��p�z~���]ѫ��P*@�1�P���6��)Hv�b��8U�FM�o]^bCrء-������Ӣ�\h<��H0E,X�˖�O���m�zt���.�)?��{j�p$�#�L �lNv͢�iM�d�,�i �-u0F5-m�{���Cݏ��\捲�XљPt�&伋?��?j�]��]{�]EVI�9��:`p�55��
x�tƳ?!����j���ٽ��/�!�&I�[��5F&���6���
g� K�ٙ������B�mWqC�M�N�l��|A��W�㓨A�n_w���]���z�"�w1o�#\�<�ݑ6o�z�yn�N��
+�G"�5,����'�0{��'���H�����i��Dk�����#�{.Z��0ᘜi��	�A6mA�U7T�ԁ�-�SI.܉�7$m�v�v�|,vyZ�X^���	���7�����GⰛᇗ��-�@]���vF��	��K��Y�Xn��x1,[�rM�{�"U+�.<��B�Sw��ًc-8M/(�o�q���������V���
�����Y:(���;a�7��8�َ������ʌE'H�㮟>��Za�.�g�g��䜏��*m��L`��J]��	�����f���.T�      0      x�}\k�l-������T#�<k����:������R��k���m����/i�RSz�T�w�ߥ�+駥���'��?����䕾��ϑ����\~J�,0�K��-���[�g�����u/�ny�N�_^n3E�I_m/�n�������.�ػ[>��^>~�63��a����L\d7�s�.�_�?u�~]��}���ޏ��"s�M���<a�����y�߿�������eD�bk���w�i�?�����j���I(�G��Pn_� 7�܆l���vW��'v��O=%��AovZ�y�X�	���`�P�74#�^��G��t`��*�(��eK()H��c}!�Ů��ψŹ��܆�wI��4���e������`x5�~�K�������M	�ڻE�ԯ��_O{?9s����w�~oi�'��#����^�*�7����ӭ/�k_N	T�P��]/�E��>ﶅ��N])C�˹ț��Y�z����{���.�ߥp��_�/Od�;o�ڲv�rn����Öo�������:'�s���b	�-î_[@W�~�����  o&�2��5���.�>sC�S%: ��������
.���>�z���s�M��
���/���z�ۓ_�i����|Li��__&䭝�� xt����lce���?a��$a�5�
�%���~�ߗH+�w��������-�|�.�������]�~�3保��l�W,�x�'��O����W��os���N�����c��ʡ���#��F��C�������A�s��A��_�BF.A�{y�� 
V��V >�=����+�у���?�BwRN��ybK�* [��_��v�;]�m �K���M��I�o��4�)!B�j ��^��m �3=�<�l�_��9�]��轲u0��'�%k8�D��lBY����r�}8 ������`�Y�v�&��|Z��n����H�:��i���[Aqj<ů���L���i��\t(��fb�5��7�R�mLd��� ���7
�����Ğ��/��Z�����Jn �^�x�*W#7y�C^��Ϭ?�D[���@O��*D ��0���3bh��,��ŉ믒N0]q�[�3Hd�ঽ�M;}��x��}u#J��n�@���~[�K�x���{<�l�0����|��/@�T@��/����gt:��;�s"�� y�t�v֮-��Z�e%����!�:�N��Kup�;����Up�0!{�zN��/� �Ei�a���m�a�h�����۶������I=�I���s��'`��7(
u���n �
��32T#�1��g�G����� �
��)b˄v� ���/oN �4���&���!�,R9$�z��%J��	|K?����·!�l�{��7���@l������}[���v���й���Ā=[�pr��&���[�b8������joJ�ߎ�+"� �� Тwb_�0-����j�0���%e{�m�"4_����<Ak�b���￶:-�"CUGl3sn��z���K"�K�{�; 2�]�(C��@�`�4MŴJ=;�l'|Y�����⺥�!R1 ��(	_(0�t�2a
�z �n b֍�^��e�pM>��^����@D��3��=���ٓ�c���G��,��X���m���]��~��P��"������w���m�Kވ�C�?9(���.�^{Q�O珇p�,��&w��M�{�� �d�\sK�����Ӽ^� P=��'S�B+ ��8���Og]͡������[�蜀��,�3���z\_���'��P�� �0>������Bj,-MxM�j�< �M�}�\�|㓡O�&�����@B��zdg]?���6G�Rf�&���ni�z��fU�m���x��ަ,�e��:I�����״ �rZ�_�:�[�z���*O�۶����3,�u1�^���V
5h�^u�R�}i���g�|���6,@ߔ�r��`z��V# E�> �tI����G9���ԟ��>/D� 0�+b�r����`ڝY���bFs��eO}�����@���O~|�0c���ؒ}�*A��57ݪ����@t�E��:�E4�Ћ�=�B�%�QM8w=�X�<�!������rW2 ��-<<��|g�� z-�,��OV��J?�X�˗V �>kE����;��d��'K���]��)�Tm}�0ȴ�/��Lq�+0-� �{g��P�oZ��93u[������bo��>�ɡe$ڕD�i��,� ѾĚ��P���fL�,E.��u��3�W&�_� z�-=I��ď�N�n_�Ht[/����y}x~���E�Ǽ73�^m������\�/�>�Է��K�z��d:Y}΀�a�r�MI��'��96 �C��:x9dz��=Y@f��z�sm�d(�P��zb^	_H� �!MC��_ӥ���AY�����y��iVxr�B[{&�;�®�sW<����Ch"�RSE4�砍I[%�,8�BQ�O�1�/ZX_�4��B�.P罡���Q�@�(�*{������w���jA��h�n�TFg�N?hˎ_ٔ2ϗ�ůi��!9��RئvB�T�'�~�>�;���	����(Qɰ��7�[�)wr�-qiG~S@��a�:1yK!����*	�I����$<D�sX@{ҩ9��`�N`���O�K����Yz%��� &�5��W�Y>;����ӕs�#��,�<��5lp�tv��"	L#����gb��@C��G�r�����.�a.�±�A&g��y�ڕx�� JH�����K�m��p^�j�@|]5���y��Ft�%�NW&Ra��4�TB�:�FFW��"��UY��]������W:�]�|�������#�����_�Z4�6
!�E��WMJ��)���+[��1ɧ�i�I��	��6��۪mibluUjE1���2Mf<��o�F�k��S��ޱ" ���ĺ\���ET���S���(BX���Gn_U�v���Q�W��WP�j�^*`��l.�YڬI����!�T��9@��h,y;���}�;�L駩�p~ �WJ�3�]hl�u��^�W.)��I���Έ�C>^W�V/�C$��R��a���K	�ȓY�Z����;,�m��zXAG[�b<�����;��C�5�q6��6nc)}#4�e�)�b����4R�lX�5x�y��b�����b��c��#��A�Gs�͇l)��"�
��̓~��7X;�K#�2�yMW��VX�G-� �ӵX�w���ژ	<3�܌���I�p�my�e�tR޻�}� +��O5�k�	Q�R�伟!�6��*��y�>��P2,<�N�[�1t�e%W\2r>�ӟ���o�3�3��=�y|�����OQ�iE.���#l���B�f�+{̓�3Ԗs�SD�(���SCz� h~ƻB������N��>�!���VX��ot�|sR{�!7]M�8?Պ+G!�r pjD}�t7��G�>=�0.��J�HzoQ��?$}���vpG��2I�,�e�kfC$�m�yc�C�����2\m^%��P9wHY����Dr>ɹm0Ȫ>b �\�j>k�%�퓌WW�׆�v�A�k����y�b�����8KW�N����v��Z����"��� �'��_r���kw�I�A��� L]�@��]�|�sL���Vs�F�w����0��yO��6� /r��E�'��nW�P�]�^{����6��ZLjqfG�r~�'h�3H��Z��}��n�Q97�1�]y/�u6�z<8��8�'B�A΋��z�1��#I�٦��G!G�9�σ����A����-gȝ�Փ�z�y*zW�K���cRN�`��M�Q�zEJ&���v���r��3�N�$��&�� W��"|�hf�A"ay-_�,ZÎ|KA�N�1����]cRz���W_�L:5�2t�$����g�n��>h��U�������|y3iGNd����rյLA�W�AΛ/�>#˧�3�#���e���N����勢i�-3�-��������R� �  �j���Q��r>����y�r9/�n�gm��B�+r��Q{-|���!�×F�΂��"�aױ �[ؑ�C�Yn�����C��[>�@����#�~;9���J�<�>M�W(�_a��R�e�0�$�P����2�|�u-z��p�H�����Y�d6�U�YC~��GA6Q�P*�a��,�m��AB�ل��
t��&ݘ09}r��oT��[�mr��c�ѧA��k�8z��-�hOL8�$H�5�n}nFU1ʕ	�q�n��Lw��d5� �]r&�[6,v�f�y2�7QKZ���ɸ�<Bk�T�"H�kH�q�V�)��"�Ѕ]`�H��Y��I��
m?��r��s�y���k��h�x�WO:@�]��ɕ�8��vR��_���G����9��G�[ۥ�r��4�����|:�{X�j�U}w[�O����=<H��7���H�솝�M�Ʉ�r�!�����4�+�_���c�WU)����-��$��A:�;�Q����]��
Y����>��]&I9vVY�v.��-�g���9�|�)¿) C��gY�l��V�_!�|I� ���)3H���$���V{��yNo?�,!��i_u66"CFpC����,�~��?%�j&Gs^���5��RJ�d�5	���
��+���NA�wFz�!˳(���~*|���S��-� ���$�v�VޣO���$�~�\����H)���=��p�G&�/nH{#���_�B����{4� !�~T2�����isТ��Q�,U�s�\�x�]��>^���?"!��{�<M�q�b�����?Z��Σ�6����G��OV��N����+�>{�;C6�˚�L�GY��v�Ƌ�O�>�u�y��p��;��"
!��|�ǖ�?�����������s�      1      x�e[Y�+
������(�����:��<��~]£��P�)O{J����}��ꃿ��j%����f����5�OR����%e���W�)�=�H�����+��~�;���v�l'�g�w���KUR=?Nj϶���+z������^�p7q� M�[-����5.����~�N�UO-��L�Gos�HZ��~��4���o��Wh&۠��.��A�Ɵ�ī���5��['h���h�q��o[Қ�1�c�V�����&?��6�v]�)�օ�4��y���\�m�f��:�cS~��Mx�W�u��{�Λ��Q�n*��Z%��[��λ�P�	i�k�N�'&��+Q�P�%�P�/��@;�B.�I�����z�˪+����:�2��߯+�lA�ݺ�vި�����Ў��-t=��3BO�z���u=���w�h�d�\VCӑ��}�S'��~�w�C��L��L�}�6T���o�����;C�ئ�nc=P�����H1�_7�G��fy��}����@e���o����п)���е��d��E��2���-�-�Z��ܠ���~��|l�+��*F�;��_�鴷��j�����,yz1��\����i�1�~�dI�&hǵ�K�p]�y?���]���-�|���Pv���u�����|L��`w�~��V>ho���a]D��@���ﱷ�F��UF΃\W�BbO,o��Ib{�k�Us��h�7W��w�)���n&����Oy��Q�$n[�t�8<�m	by��~F�,MG��$���9:��W���5����;Fk$T����1i�y%���Q��I���$�@�t3c1b�AT���5ޞylI�7�2�3W�g��xӻ���]?��#�kj$�BC�{�g��H(�^n*q�:�9iS��z������X�����p�RR�>�#>��F�@IQ��(��+׳���p�E��*d3.�^|��Qu���u)���U͝�@ԑ�jZ��P=�j4�����%��q%���HQg���E\\9/�S���Å~��]��G�l��
D��b�gXԵ�M��o]�a"8RG�6�Kb�a+���5��("O_��sH^~?�~b|Q���ސg����=4ĕԫl1]���Jɕ=V���#�K��v���@Ԯw���Q�ރV��]�aBNg�v�'qxH^�z���U�]oF����^�ҎԄ�&�ʃ�Gti�j¶�\�_M��pg���}�xCxj�������ה,%Cz��q�,\��?�H�</
�B�_a&T��,�%u:�\F��_&94�%��;@{�a0���2[I���Pۯb��k�M�C���e��������a�q���#��}��-��+��r�_Է8�^�(^�s���닛�o�x��s_$�D�mB��[6��L̢r�u�,�f�kAʌ�=��C�F��9��?k�۶�,����!�,�2����]ka8�\��8wz��k1G{QQ@`�I�PB�퓋V�YYYH��ו` ��*������J�x�o|���	�F����P�����:�
+2�:ò����hTd��e�j��B%V�_Q\��Ny_�=W�&2��*Лk����+���|Cf�#��_d��2�9J?�������1U�ڻž���������xv���q�C��M�f�&��6�J֛��2I&��,�n�o���j��^�Ӑ���JL���z�ܡ���7Y�}����Lu2$�\���8-﫼��V�O�H���_!�����smu�9eEzs2�r��:��2t�o�E�8���<'�P�+v߀(YFg}��E<V��*�x���ը	-wOR��\Bр$u�C=v����ɭ������z�	�&뚹/x[�dy��ԫ6W�K"ˎ�K��W���%���.�f}�d|QP./qI�p�`�L��ցZR��Ѿ��dPS#��%�}ҏ
\bk����aq N.�\:�2p�p �kũw�����Uï�%�d�˲�KF'�Ion-�x����p� b
_ҀK�z�\2=x�~�Ku'�ހK�Q֧�K��44��%�_>�ʛ%�WŨ�LǴ�Vy��!F�dz�#x.9�����d
k�Im�j�F��d2/y�4����.�ðrXw.1�H�؀K�c���M�W��-�-�7���?�\2Y__݀K�"��d�v��,D�c��E�U�:}m���,����5`�����n�����7���nI�p�bE*�.YL�c�h~��f�4��41{o��1,q~�Ij���X��'�6��5�C���FP���!�.f3=���1+_�t��]�\���_؀K��-��8����4��S?���;�C��z��d��i�%g�{a�\����k�Z6�":�zÏ�.�Ԓ����O��l�M�&�w�؀K�@p��p��.FCd��?xC:5�,v .�^��B\9k��XC���Sl�����K���#�ϛ���|~e�l(��_��eq���=���!�^����e�f�L���TՒ�T��WLw�b�9OM��0��{��IT<_��T���ar����\���3m��]�����n{�����.2��?�O���������]��퐃�{-�S�h(�qj*��pb }�F;���i��S'��7��
˥)X�醣�r@ɮ�ךQ�;��QP�枤�ݨ�(^M
�Q���O��uj�("/v��ݑw��Y�W�>ZG�¿+���d]m����&�����VY�ky��d����KP��|IHRT�z��D�w�R}���'x�J��:�r��-�Z孲k�]r�kj�FP��>a�)VFȒ��7v�#��Len�=tTf*�
��|�ӻ���R��/��$Q+i�ӧ�J�yh�஭}tRP1ꅠ��F�����Gs��;��󎵨H4N�D����Z���kc�7�����6k�I� ���Ղ*�0��N�$a����S�yA�@�A�#8I*;QI�UҾ��:����^9"�`��с*rn��"�\`�x.���j�΅�8- ��|k��qau1riA�n��q��qa&�G�	�:�[Y��ߵmA��{�q3����fө����)��ydם���yt�LC��%��\"�w��Z��;��K;3��8\bkK�\�9�r .9�#���C=�~��3��+�%}jx\r��}�%���\2G�i�%��i��%�yKr\����өW�E�K�8� ����mpɠe�k�x� ��d�c��	\����C�%��ٸ ���@\2M��*�%c~*.\2����C��tNL�7���r\r��� ������*0W�U�����	p���`z���y����%��r .�D�/�K&=bNy���?nsY�%���kmu�5�ҁKfc�0&��K|f �ہKf���dp�$ҍw��%�cw�޼���o�+��w���((� \2Y�	�ށK�ϱ���򉗜�S�k��@:p�bo9޸�,��sv������.Y����Pˏ���%�s��;pɢ���t��4\�Z.��?� .Y�'��X��S�;p�Z��M.�f~r\�}�"��P�O����\�����%��?�.9��=�ЁK6�>�B�%��߳��%�9õ���ٰ\����\����p����:p�fe$�.��q:p���H��xw>��˰��+.i/�5�z��3�xc��zl��iz���ߤ������缒T=��E��u%�>q�;�7�J�tz?��3=��!x��e�3T�L��i+�9���<7MB|-��a��Ld�xOD���gq��3�k��+�u�GD�d�7��3-��7Fl+�\����x�W��)��b�%r�P����E%�cb��k��z�ʵr��f)u����v��ơ�!�����S���յ/����8S^��i�ӪD��5�-׫��{Wֹ2�O�<s������N��l1�&꣕���*o>�|�A��tH��1G�,��s6�NM�����v��F���
���K����7���y:�)<\s����P��c�P�MhKƖ��� $  &�~ր/k!s��y�,���j����j��n�S��nQ��O��Ũ�L����x��9C������/|N#.�}�slb���*_�+q�Y�gr�]yNME>?�s�7^r_��{�)�9ͻ�Qk�/	#dI��J�c�$��mx��bNȣ$���l��t2컆7`��*vt^*>�xqQ��W%�:��LS̋����}����ש��l��Nw��H��tVC�[&؄w�k� N���C5�uF�k_�-r鼙����H�1&-�[K�a;u_z��������e�oF���];�7�<������ūw��&� \2�~��)o�����`6�b�uN��/^g�����%����J�ͤ�A⃵���R�J�u����p�`��.�����p���C��G��Aϕߙ@^�OO n=�M9�_���S����>����D��d�Bt}3��22p��n��7����Iӣ�{�������xHa �X�yUp�O�G�u`��Z|��ͯ�X�YsPN_��k�%�'>⾠,��qp�O����C�����Ո�B:�%�}�C���������c��B�w.Y��߀K�����,�o��d�j�/p��\~ո�ǧ�Đz� ���Lze���k�W�a �,�شn��M�݀K6����'p��i�T�m{m%��.��gE63�K6�'{R�7����Wy�����a�P���d�W�y_�F��ߒ�l�$#��l�����ʡ��9�	\���4��ͯ�B��düI��<xO�xNW���������X
;      %   �   x�M�;
�@�z�酅��G�Al�	��
ک���Bo����fod�6S|3�pD�/����@���tyc?��=��rY�%K)�&J3Q,�d8��[��%J'�]i�w.��R�53Q��d>�|�87�e����W;8���~���zZD��ԈY����Hp���sU�      +   �   x�U�1!Dk�K|��x�*E��9�)��)�À�X:�������tK��T�+��$���:I�����t5ws��7u�, �ʄ��Q'���z��Vے���8�Ȥ�{�Δ�i��Z�,�lSuP\i�j��h�}'f����:ss[�X���m:>�-M��[nn��6���Ǻ��
:b����)��Y�`      /      x�u]Y�%+��>w�_�6��ƛ�
��+�O�� �./{����B����&�E���o���'�����4Z������2���b�e���yS����_�����<OW���!�I����'��O�Us�J��U~!��"��Zs���M�/ �4�߂�p}��ON���е����C��S��֫�w=4�Q7�9�Aߘ2/�o�c��� �K�O*��v�u]�����N����M�ո�L+q�V�)�����k+�0�Y�]�L���ka!Q �
�mO]8��eǀ,
�+�y���;N��'�����"�L�⪛F;���%��i�z��,?�s����Ѳ�֮uY�W�:����_�����v����NeI�.�*^9�z48��:�V�8���MM2ޗ�N�n/�~�
b�*����
���Z��P4חdϵ��*��Ӆ�:��u6H_h*���b���,�������LgCW7�hg3E�O��z$
�7���^�Z�����O�OdH�Yu�<����)�e��K����8$<f6ײ��d,�A\�Ʌ�t��vwf�o�T ��ol[d�@T:�6=_�����,�z�ڇ����,��KW�n+t�iҵ�F��Ċh����V��"f�XX��"���27�嫓qX&;�I��s��(d۾�Wq��'����[r��\l�{�a��J�DNqݱ.S�yJ?�W-r(zmu��ǜ��w25i������\��u�>d ��*Y�Ci|o���-�c&W[�������ހ�����A�����1��Ϗpݰ^[�~G"��l�}�~=/�\U2pK���K�&NGFg]YE�#S�Ԧ���tZ�4�NƂsP�Yw�b�K&�������̲��C�^z����'d#�\�zѻ;ma�����jf�y��l&�$�k��qob�}Y�nY�����8�ď#o�?l��ѝ,?�*
c���7���?�g��Br����|���b�^MJ���+Ѱ"Gl1�p�U�}b�,�arK=z4��R\�q�6�	E��l��L?wX#�E'|h��[Djo����4�la�`����i�D~u��[/;�Yo��Y�+K��&9_7�Ȫ/3�<�?qU��0=Н3��
ֶ�g�:C�-���ű�8�O�t��C"��P|��OL�Ē+붰|]]L�Іչ���r� �-N;�ң+,=�Av9��RV��)Vk[7���?+,���<�Z��эx��Z�3n��J;�M��,Gt�Eco�=>q�Ն�cN�;T�7��Ĳ���"@��cT3�|�aBy����^�܀��r�;�\�pg�S��W~��_��Bi��X��+P��V�H���~{ݷN��&���Cɠ�Ѱ�������
˘;͘��y�6%2�hǉ�%D���`r�	Ƽh�C�}��^ʽ.�?��ğW����Hv�:��U�Sg��$	�c���7&��k�~>�_�h�v�P'�=��$k�4r�x�\ٚ\�������!$dnX�Ys@�wg�b�X��퉓nJB����p�n&�4�XB�!"ќ44�67+y
��a�馥�R@�̸@߀D�B ���w�u1	��雟T6D|�C�O��!�ZJ*n{_I�+�IA���A3����w��ڇRzt���@V[J�l���l���&㟩'�m�HȀ+ߑXBM4W�tYAI3��N2C�T��`��<8�3����;�������a;��!�Ѐp��I$���r|�_��N����%�0ɥ�3�֣��-�\��#�6�C9)^�*�Uw?�fP�<)A��P��ZiN��1�)$����YL�;�/���F<�Z8+�y�/�\������a^��8W�>��q�cR�����:�!4��(W� xt℧:H�Bi$���֭���~�mWr���+M�� ŚW���;!$��(Dt@��$�.�x^nM��uDr��Y;\^Vf�l��Q<$�����?��|�,5];�Ô��44+�5��+h�DAP$"ގS}@�RX�A.���v� $ă�����W���\bDh�.��SȲU8�AhL�8 ��pױ�3%
�3�t{"9�tYI�*v[�$o�tr���@�ί}��2��A\��w	# M%�2D;u�ߨPs�Ʋ�<�@| 9c����[,��(��N�I��f�=�T�2��-��T,�˾�d`	5��4ܺ!F�4�XD������,_�[��=���(���������	���=%�|�����Q-�@��</G�r9���f�J/]be�zr n��uܱ{*L���}ɏ�0������'ʍ�;%I��\Y��K*�87/�`�g)�ܵU\��m�%v�?�Е%��Ĉ�:]���t��Fԝ�`�����C3���ĥ�SI5���,�\^x���Cy�a'��D�m�{_a~��)�8U2�6�e<#4���$+���%?۰Z��0Y�$)$���c�XmZ���,���{��IfAȅ�OͱZ����fu���~R�K��q�G0*�?�`N�xT|,����5���^�&�.e�sKo�W<�y�$�k�1�3��uE�ͮ���jq]���jo��r*����Z{d����ް��M����\��+̳u1�AE�Hk��O͹W>q��|�]O��r�̜e�*'H�[ġT�v��'q����p8)Sx��%�[�W�p{)IT�ꀞU`�7,�&K���boW�Ŝ�!�}�۬J�+�Qe��"�@��J ,��n�1�����qc_E˛�ú�ym�*�.�no�+�Π�5cR4�1�=�Nh�q�T9�12��<�fH	�p�=m��G���!]��j��1o0b�*�GNR�NR��D��%=8�_2a����G)Ec'YZw$H�ԥ�
�>J�ά��iU�܉Y��0Ճq�F����J�F_టV�Ny�m�%Ǧp~y�t�мKM���ͭX��v��N�D�S	�n��YE#�t��J�G�96�����B%rE�,AN7�Z�o���>3\���pO��C~>����aTϥ�_-��~ם�Mպ���:edh7�\(h��?��U=.I�D@����>��}��@;�����f��|�e��%��`(of�� Ou�� D�] (-$�j��g,WU��"tڍ=2>d�W����尿	G�9����w���R�����x�Ny���8�(�	B�$�Q"�O$<�� ��dU�����*8۶#����%���,z���%�%��g;���\œ�����{T�l80�b:�ǋp"�l�?�ōR2&p�k+K
����Y�?r1�qE/����g�����z�y�Fw�B��"ܒYz���x,'p�d�T��T4�tU��)ʇ�8�$����Z)�0�>JD��'�$;��E�����Y-f�^�u<��8��m\[z�0R9�9v^Yʼ֑
qa�v/Z�?��Bx9�(l^me�����m��E[uCD��]��^��D��s/��Dz�`S���%��sg´�2G�n%o�m�d�t|R0�B�Bj͖(3�r�U7sO/F�P��[niT�w�,�is6��;���#�Z����U)���7s����)�G��{�B*�R8�����Hh���=Ý��>"�/�X�s>�^�lUmV����G�3-a�H)ns1� ��j�BZ/[pWj���A��K�(��H�Κ}�By��$�s��h{��b��چ��y�G������!�B�<����ܭ/MG���3�l���$�g�����-j_���#��^5	��a�G��r}Q)�6�.86D������>Ǭ�t`R�3��=T������hIF\88�(5��֌x�b�4)�Hd���m��tTx��^�WMB=�q���e=���R��Dg�C�����)P�d��+�y0����`��(��f��?B.C"C.�u���J~akN�V�Hܱ �p�d�ws��l~w�L��4CR��D&����n�(Rq�8�+��5r)��Ш�+��9V���p�@�4�W ,-�r���e̚�`��HV�"������0��Nd7х�&�     �_���W�/+�%aNG�o�m5��3.n��� %�.�qiE�G$�so;�/�у�8����� ckX�c�.!��is�ˍn)9��FG�A���Т�4��PJr��ru���*^�x�:�Ⱦt�Y�D��|��2�udeCϴz�X*^'.P*�x�XT�����Q�%b�s٩�q!�)zi���h�_Llv�^j���n��l3^o����u�[W#�f]���{���9fuI>ki�n�C�To<��g�Wb3�l}׭��~B��&�V�8�,3���eIQ�R$�^��qJ90t���hW�ӫ���
 ��^�V�\ip;H�^��
����m<���NS(� �m����T��ﰇ,�ш���tY� <�i�;�EH�Rܙ�sГK��҉�a�Q|(!(�MF����Z&���yy��ʀ�ՙ�q��˸Y���2׌�;đ����$_��ϼC�|p;�<��X�R�&#�ۊ�h�3�/P�	�e��[E������"D��3�#��z�f�He���l�_�0�1�Ѭ$������7�/M$��JWf��caa66�� L�-�̮dN��8g��ά	�6�8�'<@����PrJZ��cR)����$���[)my����,�BDLo�Ļ��̩��d��;��k
�Ь�#"�M��n溴�G��x`������A�@H?76)	�7��	D¤T��.c	`��(�)Ϝ	Rއ
7U'YJ	��}�h�Z)��Yj�u��k� �ci��x�QL�]#�h1�P�I�Y̊��du�̒���o�m�w��l��m�'�pk���"K��u�%��t6ػ}�b�����E�G��q-ct�gE��쐵HC9��̮��S�H�k���B��^}򹛡T3���m�җ��9?���m9ڙKP�jD�m5֩f���P����"�@Z&�>�ᔴ�5.C((��'��{�fjƪ��[s���fC�w�B-p�^)���knh�z��N+�Y�����������QD-�\bD��.�DZ%(.A9��4�>�N ��=W�(�rG�G��Z��~jr���~�ɵ�Y�ܸ��R|n�X�_��� ֚�*F�*\h3�wf��t�߱?�͍�e�Z�-���+�z�A�Vu�[)�zDD\u��z���+_��1[о�a��j�E:�w\�=e�VmE��9fm���E1�ӝ�+i�����=�c��Mj� �73_m��HfDl��o�Sj�����Wü���wR�9`�V��GdK+�Q�|
������i!�T�HSJ��u5���t�j��s	�3B�-m�HO�)a3Bm����;ۃ��dJ9��8邀ۊ�&��Gy51Ξ����9�k%����+�v*�ܣjʑ�� �N�k�� \�cz�c��M!g.}�����Up�q���İs+z�Vf>�8}3�S���YX������6�A�aջG{���1x��9Od��>�RzK�V,���/;��R{Բ�����T_�#�>)(�'�<Zw*SY�~�;\n^�	4^�/)��	)�Hά����ܓ@ _O�`�Ph�_
�P g8���k�շ��g6���y�JH!����`�b�@[�G��c��`�j��\�\p#�.4*��8��:�ޞ��Z�ȟ�4��B�8����'u5n]ћ�~�������i��[�^�{��㗃�G^����b�D*B����v�
RH�o{�J�%��цf�x+w�\#��뜼����M��c��]_Q�&���G[���f�����V��Ȫ������=ROk;�e��W��2�ظ��l�1+��D8�i�����L>�P
l`,jn�?�+HᏇ����H+�S��G�rg+�m6W�nm_ZSH`�`�RS��
�Bo1�]�������+�3Mi���;ۃ<�}|_�Շ�@�<�7����8�^qdD�]Q{t͂
d���HÇ�ytr���#G�k�0ql��� �鐆����lq�^��n<�Ҁ�nN��_��J��DLy�w�Z�iYa�0�W�X*�b#��>Ѡc[i�o��tŐ�y^WԪ4�=nc|
�ɾ���z\!z}%h�:����G�� �n�<��?�=��irj=�5	�:�Ï��U:d� �ѥ#NKꂀ�>�/F�b���d���cԭ��9�K�zV&
����Z��Ce��sӔ��/75�:Z�ڈ�
Q_i^�\�6��Wu$N�]Nm�0�'i�$��\�&��4�{
�������s��ݖn`g~�u��M�b�Wg�qi�Tǎ����5zv�-ʲ3'd�]����#FV��N����H!Gz�=�/GpS�?�՞�XG"4�����t���ʋ��M����6QJ�^e���*lC��n�LO��Ǥ%�D:>1�a���V�3����h�$/z���F���iH��G�&��w��:��P�"��ꆭ;�^�l���4,�?xѰ����tu���V
�i۽�A IGH��t�c�s�����a{F���A��m�?_!V�>�2܅w�7��sT��	���~�CI�����}]���W��`����v!~d/����F?8���o')-8T������Z2���?Z�R�A�=?S���z�Q���H�\U���-ƕ`<])5�d�8ی�N��Ѭ��QI��ɝ蓦:yޥ_�j��:e�U����Ⱥ�.��Z*rB)���1󑞠�,��o�Y�`���'��PDA��{����eQs
/팬��KOԼcn�[�-G d�G�[�5�ӫ
��?I}Ԝdֈh��[��5?�hg:W|$k	m1��3�;��k�p��Ag��<�PUђ)�TH�=,W�h~����.?#k��\�Pk���~�+���
���F�}8�]n��1�]C;U٘�S���|8�j`u�t�z�Fg���P�j��
Qy��+pC?���-r�vi����9�5��]$ϯچ�?��v�5���V/q"�0Z�<� �4鬵]��*��� I�K����#^���6}���L���NL��^H��ܹ��x�ң�|��)�}�!/��Ҍsϔ�G�u����c܁��%�aũ��p�J�#��f�8N�Ů1�Ɓ%�� 0�{�c��V7�9�c�gy<�9
k�/k|۬�v�����M̵B��3��~���*�<#ɣj�M��W�Ǻ���J��fR&�h�^���L�$P6�9᫥Z�n<+b?�I���C4e���;B�ݓ���8��ɒ��6G�'��,gI�
�~���~�y�2��&/��f�S�k�[�d@l�+��G?��Cb2*��ݽ0 ����-0PBs��2�!���F���f�����`�fִs>�@Yf�`C�O�������Y��3_ջ���c{��@��H���&��O9Z��w���u�Q��i��	�&�-���KVPݶu��3������lh���#4��E�4��'&������,��nL�ǳv��Oٲv��֎��ɤ�����s0<������/����d�����2��&��{�(�Qt��M�5�ڒ�TdX�u�32-c+w}�ƥ%�k�Q'���I9f6}x�Wd�x sk�k����iJ�0h{�gIQ�����@���x�ޣ�[��H��8�i�'�v�g��	�Z��|�Ԟ�-��Z=Z,!Ij��	�#�F{�=P��������Q�̵�#�M�:�uQ&:�Q��C�y�}�.���;ֹ��j�z1�zH�����Tj���8F�N#&��W��h��''خ��ܼ��#QHzw�p��t���d���qEk�ZrBfq��a���,uw##�3I��I���mc@� �r$�?�G˸֒�[kG,'��Ԯo?��Slh�q&ZM������.�$�"��5/�W�VC	q�!V�+'�����/�'*����-7�gk��H��9x��h1�lǃ�9��D��~-$�Wi�+�vt3Sh�V��T��<������K�|�����T8E����G�+l*������rm�9 ��^젬��V�˛�&��x�8�93�=�nLsQ��	��b��W�l�Ɲ�9(!v�s�����8 �  KZ�O�	G<;�w���,o�XRJ�ܦ`bz􊎤�r���W�8o����ǉ����~�w��z�|'�EA�i�&���P���.�7���y3j��}��F
�S
.��kqU鸌�s�l](��ovp��;����*I3�/mqJ�ԑ����,��<������Ʋ>&��� �|�c?�6-E��=Kq� �,e� ���%���m
�~���|M���9�4{�n�ܨ ��ޑ�����U=��G��|N��Ç��Y��'n�@�ӑf}�>���a�9�Y�`iF��
�/���w�Ă�}M��Y�U�k�F����$�$��������f�쩣�]�\_�L���c���P�r�oߙ��n�{_�r���m���hB����?S���̮��;<|��&�Q��F&�;����������s�R���{��c��y�v2DgoTû�	�1��=�:�'�_K�#4�J-.'��"�#��TG<�}�=�C'��;[(:Gyb�\�O�H�����Q����u�9�Y�Gl���9nO����N�G����S�L+���V^-E�R4�����b����{t�f�|���}*��m2g{L]�\��̖������n�$9��yי@���?B8��2�'$i�����������������      &   6  x�]Vۍ9�6�̉�#������mO��Ү�+EQ K����ù��wy�͈O�.�F��~���ݝ�r�l�6�m�PN�d%_~����)��#L��z���Q�*\F��z��I(;���N��5�l���(V����@�ϳ��r�Ӭ9� �<1ed�E[Ix���#��2O�,���}�[��C�%'n?�ȩ���Y�G��"57T"$�����\�Y'��&$#�K���Vi�����<x�NM��ͮ���Ԓz[��xw�Z#�^��������5� �[�\����9a��6���i���8`G
Ⱦ܊�te����x���h	��jל`��xO�d#d~���Y���@h�a��x�x!��5^��LZ�〬nl|�P��'��0���?2=�^�NW'Dӹ�uSK�%�2^�n �ht�,�~\��qqpi���t��u: 4�Ȳ �P����{�Ç��|�����H�FS+�bY܎��w����Yb�^"�z����j�5�3�f�g�1����5�Z%@���.���i�h���v�H��C�
�fY./������#P#���`���A�丱�b�30�!f��}
����l5�X���3��M8���ͱ�tx>
�Y6��ky��%6Q����`�K�#�&�1��t�T<�=֐�
Ƽ�<?uC�]��� �ON�����A��˵/,���4��yo���2����T���y_0
�K��ږ�m.t�'�yA�;D�A������г`�T�!}ȼ�ޛ޷�bvG�J1h�5�{��lq�d��f��L��)����~��5c��jJŴ_��]Ǜ3���V�5�5c�(�+}���0���z���jݺѱ��|J,��9�g��}Ae(�CW����`gc�1+ȼ��m�\u0�G)g�O��&*C�* �x�;�Ia�16tR	V��:����Q�*}�zU\�z,�2ѯ��Pނ���W}�������2U��wO��p����B�[�G<��2P=����ۡ|��L��n��Oa��լ��5�D��f4�w�!2�A�P�jyW�=-
,��{��2m��8�4R�|�v�Mn�%���OzN�k+\6L��G�K���q~u���P�$��c���zG0<��<5�����M� k(|����?�aM%�41xQ;r���0D#k���`�K��F!��;�=�R/��68���jÊǲ���=k���1��o<�R��;v����I.4���<�aw�4��;�|3�h���:�q���$$s���aT����v/z���������{�1      #   �   x�eP��0�N�� 	X�aڂ 	D�	�A(
��
獸�C|8����9=�-j�	gIZ4^�O;&%ӻÅ��:��	M�cK�#��oo�kIe�J�Qd�R�X�T�&H��쵞Ȍ�����?��je�M5Ǉǁ�2��џ�?x'����L�+dΞ�׉���E�����VT'!.� գ�hn����z�l?ٲC������VK�cy�:�?�i��v�� %.G      $      x������ � �     