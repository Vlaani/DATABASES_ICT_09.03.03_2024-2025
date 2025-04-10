PGDMP                      }            carRent    16.2    16.2 L    1           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            2           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            3           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            4           1262    16398    carRent    DATABASE     }   CREATE DATABASE "carRent" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
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
    damage integer NOT NULL,
    date timestamp with time zone NOT NULL
);
    DROP TABLE public.accident;
       public         heap    postgres    false            �            1259    16492    brand    TABLE     F   CREATE TABLE public.brand (
    id integer NOT NULL,
    name text
);
    DROP TABLE public.brand;
       public         heap    postgres    false            �            1259    16528    car    TABLE     �   CREATE TABLE public.car (
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
       public         heap    postgres    false            �            1259    16616    contract    TABLE     >  CREATE TABLE public.contract (
    id integer NOT NULL,
    instance_id integer NOT NULL,
    client_id integer NOT NULL,
    price integer NOT NULL,
    collateral_value integer NOT NULL,
    date_start date NOT NULL,
    insurance_type text NOT NULL,
    insurance_cost integer NOT NULL,
    emp_returned integer
);
    DROP TABLE public.contract;
       public         heap    postgres    false            �            1259    16664    contract_history    TABLE     �   CREATE TABLE public.contract_history (
    id integer NOT NULL,
    contract_id integer NOT NULL,
    emp_id integer NOT NULL,
    date_end date
);
 $   DROP TABLE public.contract_history;
       public         heap    postgres    false            �            1259    16445    employee    TABLE     W   CREATE TABLE public.employee (
    id integer NOT NULL,
    full_name text NOT NULL
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
    info text,
    cost integer,
    date timestamp with time zone
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
       public         heap    postgres    false            +          0    16593    accident 
   TABLE DATA           A   COPY public.accident (id, instance_id, damage, date) FROM stdin;
    public          postgres    false    226   �^       %          0    16492    brand 
   TABLE DATA           )   COPY public.brand (id, name) FROM stdin;
    public          postgres    false    220   �_       '          0    16528    car 
   TABLE DATA           b   COPY public.car (id, engine_id, transmission, car_body_id, fuel_consumption, info_id) FROM stdin;
    public          postgres    false    222   6`       )          0    16561    car_body 
   TABLE DATA           L   COPY public.car_body (id, clearence, trunk_volume, seats_count) FROM stdin;
    public          postgres    false    224   ja       &          0    16511    car_info 
   TABLE DATA           D   COPY public.car_info (id, brand_id, model, description) FROM stdin;
    public          postgres    false    221   0b       *          0    16581    car_instance 
   TABLE DATA           �   COPY public.car_instance (id, car_id, reg_code, vin_code, special_marks, engine_code, last_maintenance, price, mileage, year) FROM stdin;
    public          postgres    false    225   �d       $          0    16479    client 
   TABLE DATA           H   COPY public.client (id, full_name, phone, adress, discount) FROM stdin;
    public          postgres    false    219   g       -          0    16616    contract 
   TABLE DATA           �   COPY public.contract (id, instance_id, client_id, price, collateral_value, date_start, insurance_type, insurance_cost, emp_returned) FROM stdin;
    public          postgres    false    228   Dt       .          0    16664    contract_history 
   TABLE DATA           M   COPY public.contract_history (id, contract_id, emp_id, date_end) FROM stdin;
    public          postgres    false    229   �|       "          0    16445    employee 
   TABLE DATA           1   COPY public.employee (id, full_name) FROM stdin;
    public          postgres    false    217   W�       (          0    16547    engine 
   TABLE DATA           @   COPY public.engine (id, capacity, power, fuel_type) FROM stdin;
    public          postgres    false    223   đ       ,          0    16603    fine 
   TABLE DATA           A   COPY public.fine (id, instance_id, info, cost, date) FROM stdin;
    public          postgres    false    227   ��       #          0    16470    passport_history 
   TABLE DATA           X   COPY public.passport_history (id, client_id, date_start, date_end, details) FROM stdin;
    public          postgres    false    218   �                  0    16399    position 
   TABLE DATA           A   COPY public."position" (id, title, responsibilities) FROM stdin;
    public          postgres    false    215   '�       !          0    16415    positions_history 
   TABLE DATA           a   COPY public.positions_history (id, emp_pos_id, emp_id, salary, date_start, date_end) FROM stdin;
    public          postgres    false    216   '�       _           2606    16703    accident accident_damage_check    CHECK CONSTRAINT     f   ALTER TABLE public.accident
    ADD CONSTRAINT accident_damage_check CHECK ((damage >= 0)) NOT VALID;
 C   ALTER TABLE public.accident DROP CONSTRAINT accident_damage_check;
       public          postgres    false    226    226            {           2606    16597    accident accident_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.accident
    ADD CONSTRAINT accident_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.accident DROP CONSTRAINT accident_pkey;
       public            postgres    false    226            o           2606    16498    brand brand_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.brand
    ADD CONSTRAINT brand_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.brand DROP CONSTRAINT brand_pkey;
       public            postgres    false    220            w           2606    16565    car_body car_body_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.car_body
    ADD CONSTRAINT car_body_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.car_body DROP CONSTRAINT car_body_pkey;
       public            postgres    false    224            q           2606    16517    car_info car_info_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.car_info
    ADD CONSTRAINT car_info_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.car_info DROP CONSTRAINT car_info_pkey;
       public            postgres    false    221            ]           2606    16701 '   car_instance car_instance_mileage_check    CHECK CONSTRAINT     p   ALTER TABLE public.car_instance
    ADD CONSTRAINT car_instance_mileage_check CHECK ((mileage >= 0)) NOT VALID;
 L   ALTER TABLE public.car_instance DROP CONSTRAINT car_instance_mileage_check;
       public          postgres    false    225    225            y           2606    16587    car_instance car_instance_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.car_instance
    ADD CONSTRAINT car_instance_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.car_instance DROP CONSTRAINT car_instance_pkey;
       public            postgres    false    225            ^           2606    16700 %   car_instance car_instance_price_check    CHECK CONSTRAINT     k   ALTER TABLE public.car_instance
    ADD CONSTRAINT car_instance_price_check CHECK ((price > 0)) NOT VALID;
 J   ALTER TABLE public.car_instance DROP CONSTRAINT car_instance_price_check;
       public          postgres    false    225    225            W           2606    16426    positions_history check_date    CHECK CONSTRAINT     o   ALTER TABLE public.positions_history
    ADD CONSTRAINT check_date CHECK ((date_start <= date_end)) NOT VALID;
 A   ALTER TABLE public.positions_history DROP CONSTRAINT check_date;
       public          postgres    false    216    216    216    216            X           2606    16425    positions_history check_salary    CHECK CONSTRAINT     f   ALTER TABLE public.positions_history
    ADD CONSTRAINT check_salary CHECK ((salary >= 0)) NOT VALID;
 C   ALTER TABLE public.positions_history DROP CONSTRAINT check_salary;
       public          postgres    false    216    216            m           2606    16486    client client_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.client DROP CONSTRAINT client_pkey;
       public            postgres    false    219            a           2606    16696    contract collateral_value_check    CHECK CONSTRAINT     p   ALTER TABLE public.contract
    ADD CONSTRAINT collateral_value_check CHECK ((collateral_value > 0)) NOT VALID;
 D   ALTER TABLE public.contract DROP CONSTRAINT collateral_value_check;
       public          postgres    false    228    228            �           2606    16668 &   contract_history contract_history_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.contract_history
    ADD CONSTRAINT contract_history_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.contract_history DROP CONSTRAINT contract_history_pkey;
       public            postgres    false    229            b           2606    16697 &   contract contract_insurance_cost_check    CHECK CONSTRAINT     u   ALTER TABLE public.contract
    ADD CONSTRAINT contract_insurance_cost_check CHECK ((insurance_cost > 0)) NOT VALID;
 K   ALTER TABLE public.contract DROP CONSTRAINT contract_insurance_cost_check;
       public          postgres    false    228    228                       2606    16620    contract contract_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.contract
    ADD CONSTRAINT contract_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.contract DROP CONSTRAINT contract_pkey;
       public            postgres    false    228            e           2606    16403    position emp_position_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public."position"
    ADD CONSTRAINT emp_position_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public."position" DROP CONSTRAINT emp_position_pkey;
       public            postgres    false    215            g           2606    16419 ,   positions_history emp_positions_history_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.positions_history
    ADD CONSTRAINT emp_positions_history_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.positions_history DROP CONSTRAINT emp_positions_history_pkey;
       public            postgres    false    216            i           2606    16451    employee employee_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.employee DROP CONSTRAINT employee_pkey;
       public            postgres    false    217            u           2606    16553    engine engine_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.engine
    ADD CONSTRAINT engine_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.engine DROP CONSTRAINT engine_pkey;
       public            postgres    false    223            `           2606    16702    fine fine_cost_check    CHECK CONSTRAINT     Y   ALTER TABLE public.fine
    ADD CONSTRAINT fine_cost_check CHECK ((cost > 0)) NOT VALID;
 9   ALTER TABLE public.fine DROP CONSTRAINT fine_cost_check;
       public          postgres    false    227    227            }           2606    16609    fine fine_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.fine
    ADD CONSTRAINT fine_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.fine DROP CONSTRAINT fine_pkey;
       public            postgres    false    227            k           2606    16705 &   passport_history passport_history_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.passport_history
    ADD CONSTRAINT passport_history_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.passport_history DROP CONSTRAINT passport_history_pkey;
       public            postgres    false    218            \           2606    16694    engine power_check    CHECK CONSTRAINT     X   ALTER TABLE public.engine
    ADD CONSTRAINT power_check CHECK ((power > 0)) NOT VALID;
 7   ALTER TABLE public.engine DROP CONSTRAINT power_check;
       public          postgres    false    223    223            c           2606    16695    contract price_check    CHECK CONSTRAINT     Z   ALTER TABLE public.contract
    ADD CONSTRAINT price_check CHECK ((price > 0)) NOT VALID;
 9   ALTER TABLE public.contract DROP CONSTRAINT price_check;
       public          postgres    false    228    228            s           2606    16534    car specs_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.car
    ADD CONSTRAINT specs_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.car DROP CONSTRAINT specs_pkey;
       public            postgres    false    222            �           2606    16598 "   accident accident_instance_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.accident
    ADD CONSTRAINT accident_instance_id_fkey FOREIGN KEY (instance_id) REFERENCES public.car_instance(id);
 L   ALTER TABLE ONLY public.accident DROP CONSTRAINT accident_instance_id_fkey;
       public          postgres    false    225    4729    226            �           2606    16518    car_info car_info_brand_id_fkey    FK CONSTRAINT        ALTER TABLE ONLY public.car_info
    ADD CONSTRAINT car_info_brand_id_fkey FOREIGN KEY (brand_id) REFERENCES public.brand(id);
 I   ALTER TABLE ONLY public.car_info DROP CONSTRAINT car_info_brand_id_fkey;
       public          postgres    false    221    220    4719            �           2606    16654 %   car_instance car_instance_car_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.car_instance
    ADD CONSTRAINT car_instance_car_id_fkey FOREIGN KEY (car_id) REFERENCES public.car(id) NOT VALID;
 O   ALTER TABLE ONLY public.car_instance DROP CONSTRAINT car_instance_car_id_fkey;
       public          postgres    false    222    4723    225            �           2606    16679     contract contract_client_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.contract
    ADD CONSTRAINT contract_client_id_fkey FOREIGN KEY (client_id) REFERENCES public.client(id) NOT VALID;
 J   ALTER TABLE ONLY public.contract DROP CONSTRAINT contract_client_id_fkey;
       public          postgres    false    228    219    4717            �           2606    16659 #   contract contract_emp_returned_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.contract
    ADD CONSTRAINT contract_emp_returned_fkey FOREIGN KEY (emp_returned) REFERENCES public.employee(id) NOT VALID;
 M   ALTER TABLE ONLY public.contract DROP CONSTRAINT contract_emp_returned_fkey;
       public          postgres    false    4713    228    217            �           2606    16669 2   contract_history contract_history_contract_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.contract_history
    ADD CONSTRAINT contract_history_contract_id_fkey FOREIGN KEY (contract_id) REFERENCES public.contract(id);
 \   ALTER TABLE ONLY public.contract_history DROP CONSTRAINT contract_history_contract_id_fkey;
       public          postgres    false    4735    229    228            �           2606    16674 -   contract_history contract_history_emp_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.contract_history
    ADD CONSTRAINT contract_history_emp_id_fkey FOREIGN KEY (emp_id) REFERENCES public.employee(id);
 W   ALTER TABLE ONLY public.contract_history DROP CONSTRAINT contract_history_emp_id_fkey;
       public          postgres    false    4713    229    217            �           2606    16684 "   contract contract_instance_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.contract
    ADD CONSTRAINT contract_instance_id_fkey FOREIGN KEY (instance_id) REFERENCES public.car_instance(id) NOT VALID;
 L   ALTER TABLE ONLY public.contract DROP CONSTRAINT contract_instance_id_fkey;
       public          postgres    false    225    228    4729            �           2606    16420    positions_history emp_pos_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.positions_history
    ADD CONSTRAINT emp_pos_id FOREIGN KEY (emp_pos_id) REFERENCES public."position"(id);
 F   ALTER TABLE ONLY public.positions_history DROP CONSTRAINT emp_pos_id;
       public          postgres    false    4709    215    216            �           2606    16610    fine fine_instance_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.fine
    ADD CONSTRAINT fine_instance_id_fkey FOREIGN KEY (instance_id) REFERENCES public.car_instance(id);
 D   ALTER TABLE ONLY public.fine DROP CONSTRAINT fine_instance_id_fkey;
       public          postgres    false    225    227    4729            �           2606    16487 0   passport_history passport_history_client_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.passport_history
    ADD CONSTRAINT passport_history_client_id_fkey FOREIGN KEY (client_id) REFERENCES public.client(id) NOT VALID;
 Z   ALTER TABLE ONLY public.passport_history DROP CONSTRAINT passport_history_client_id_fkey;
       public          postgres    false    219    218    4717            �           2606    16689 /   positions_history positions_history_emp_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.positions_history
    ADD CONSTRAINT positions_history_emp_id_fkey FOREIGN KEY (emp_id) REFERENCES public.employee(id) NOT VALID;
 Y   ALTER TABLE ONLY public.positions_history DROP CONSTRAINT positions_history_emp_id_fkey;
       public          postgres    false    4713    217    216            �           2606    16571    car specs_car_body_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.car
    ADD CONSTRAINT specs_car_body_id_fkey FOREIGN KEY (car_body_id) REFERENCES public.car_body(id) NOT VALID;
 D   ALTER TABLE ONLY public.car DROP CONSTRAINT specs_car_body_id_fkey;
       public          postgres    false    4727    224    222            �           2606    16576    car specs_engine_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.car
    ADD CONSTRAINT specs_engine_id_fkey FOREIGN KEY (engine_id) REFERENCES public.engine(id) NOT VALID;
 B   ALTER TABLE ONLY public.car DROP CONSTRAINT specs_engine_id_fkey;
       public          postgres    false    222    223    4725            �           2606    16649    car specs_info_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.car
    ADD CONSTRAINT specs_info_id_fkey FOREIGN KEY (info_id) REFERENCES public.car_info(id) NOT VALID;
 @   ALTER TABLE ONLY public.car DROP CONSTRAINT specs_info_id_fkey;
       public          postgres    false    221    4721    222            +   �   x�5�An1��+|����o��ߑa2+!q)%(t!N���ľg(�Y�?�K�*��v/�L�$��4����{K�b��V�5�3�W�I`���R4`�o�NE#z#�ȑN�!_�'}p�����pI����K5Vᔯ&�0�Tx<>�{`�Zy4��e3��~^ܯ��s]�4�7�      %   i   x���
�@�����h��2�]ئ��<lH����}}�������73�g����Ѩ��)�����A�̧J���V�xE�����-ߠ�,,�����3|E$���      '   $  x�E�Mj�0�ףØH��K7iW�B^��Qb' |��3R��}l��Рb�	z0����u�Ƕ�%LH�(�4���Y��7Oo3)(ط��x}�-�NVQ�2_Ȉ��.PNQ:�*T�.`���W'Q��;QvD�������"Xӳ/�&��U*�>ik��ȣ�fs:CQZ1(*!9���s���CGWEZ�blr�2���:(J�E�юPT�qM,�F*�E5g	��<54F���:=RB+�;�����
֭��2���v7{(~�*G*�|��q��[����#��?�ʁ{      )   �   x�-���0C��0=�e�]����~ؑ�H"*�)Q��2�K\��S�����b��ήo�Ɏ��d�:|����7fP�V�ū�uIdK)�������?�ِCg���y�]�1�oL��`g��R�sb!��u!�tB�V#D�#C����=[���y��������;��Z�u~64      &   ]  x�uTˊQ]WE�@d2��c)A݋nLPp�D�d���:�v����B�?򜺷3{ :�V�:uNU�R�V���+����}�?�qc�c7�T8��:�L�u���t�+M� �	�b�.t��h��nh�k&'+���X�X�Lә���Y }FHCȣC9�V�e�\�+���2@��pWj���w�`��¨�܄̀\এ>�x6�ʲ�Ds�ɑ<n��DFƽ/�I�*�7�B�.�k�r<"�c+��!�	+����@ �"nR����Ph6�iHC��Z�^O�7�J�h��Ͼ{��̍��=	�A2g7����SDE#�ǎ.��YԔ��m�~!Mr�vUC���l��9CmT2J8X������䊎�Xt/�b �kb��3�?rWnS�����3��B�r�h@jA�|�Y�G*$��щ���Z�y �}gl�ҕE2�s���eF�uK�Q1��)y�����ϵBê�&ѩ�r�ڗ]�of6����Pn�T��y�y�������ɣ��s�_+�
K�g8��h���D����m�t@��#-7=$M��?��~ �<�t9c����^���-��/'v6����0;qo�Z=�E�_ճC�      *   _  x�e��N*AE�{������#��D%~!ᅨ��S�t��{8��b��U�k�pw�4�p�xY���+}g���m)�����Hi�J*��+�����%�VJx�{z�{<�խkˬ~�Y�P��� ���0�$�k����J���������&��_��c-a�x�BT=i��h[�����xd��^L��i�R��6��+\4+bCz[�����#m�G|g���3�Q>b(D;u�1鬭hz����E�|y����,�i��~����,ʉM#Z��_h�������zSgG��3�\�;�F��5����^�	��'=�O�b��Mv��<(@��n�ӄ��V�q:
 c��%~�7�~�$��d�jøq҈V4eG�Z���)=����ò�w��[��=�yLC�-9=�� a��2gܱ��4�4M��c2��X��d�)�T�����o.�wj�v8K�8�D[��ч�ui$�����í����s$��������n�b�N����[��٥޼�9����
�����7��E�.H�P�8�T�m�̡\�*Γ��ő|K��P�jJ偋sH�yiV9��_��D�x]���I�۟���DH/�      $   (  x�]X�R�H|���z��!G�T��'n�10f�b6���.����X��|��)5���a(չ���S��w��3���^��N�[)��Wn�.�(=ӥr%�{�f�R�W~��kܱ��>S���v�m|���*��[��;-
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
�����Y:(���;a�7��8�َ������ʌE'H�㮟>��Za�.�g�g��䜏��*m��L`��J]��	�����f���.T�      -   W  x�}�K��8Eǎ�DC��^zQ5�A��\R�R�&��H�tI��H��G�G*!��7���A�����������QRŊO��c����_�>Y���׷o�~}�Y�_?�10}*~��?���P����ѯ�ߔ�>]�����o&��?�C֏o$��ϔ����1���B�P`0�'FXl%P��K��S󀸌�X$������g!���pr�N}D��t�R���ED�Q,D�Z������ A���C���dR�٫���9
��<~+�������4&B�$H��@��EL"H{�1I�12A$�;�R�����ܖJw9��)�~s;�a�3/l)p�p��Q,bD�`1��a�-B���m�����
�7�a�r�Y���ΗA�k��p�C�#�'��] �B1��L�dwaH\$(W���ۑaJđ9����*х(� ��:'"�A$^=2��/�)S�A�6uߊ� )� �:UL���i��C�Gn��q�ɂDg~�9#E��6y�1CĖ
)��)z�_4��%<R�i�]���3fEr����{D�Xd����ɑ����]N�K������T)P}8���u����=0� *�AA.��8�Yn��RC5�As���Z��s�b�$]�Ԅhh�7�tO�Ro��}:v3BLQ��Jv]'���K��v�����G���K
t��QI!MbX@��,@��9H� 	�#�Ծ7�^#�0���Q�+M��I�~ȟ��6��>3'���\�r�DB�� b�����KB�`U��Ye^$g��tSe܀�8@��d�dؐ=`���� HЂ�J�<p��k��c��s��<Щ�ӓH&Zo�m|K���ݥ�yO�π�+�)(/?xz�����U���~ �e􀧛��um�D��'��X%i��J���>�RҤ�v�REJ��ڻ�A��ݤ��T@Ql@1�$�nND"	����{�i���)d!$�?�$��#��D�rD���-���9��Q	�Sbk���µ*���p���J�D˕�+ޟ��/)L$u�er���E��"��m(CJ<���A�vH��<+A�ˇ�q�U�՞Ǡi.{$
��!�[�m)	�KDAq�fF�c8��>b+VT
�:�I�[�
dZ)Q��1(�t����ƥ Z04��m�61��{}�u���O�7܍Du~�R���>Ff���σ�	�}�Bܭu;R�4�*�f�tÀ,ߓ��NO�b��lm�~x���������/�d�eT�'{���]/�/��J{����5�O��@�����JŒz?���7��R��K�p<�iapcxh�a���خ-���d����)��ߺu0r�;Ɩ�?�ax���1Ì����x9H�/��1o<DǸKf3qM��tT���e�m_�����D�ky7�q0�O5��=�n�2+�0{��0��Ҷ��dcG�)���;�����O�l�`�ϼ�)��
�}��a4�=��7H{ʊ��j�n`4P���7	�R�QЬC��TLݰA�ͼ+^�o"Y�4�$�tv%�ҁ���l���p0��!��L!�y�^�}�+>jn�jP!v4���N�Ԉ�S��M�?�i�Eq�r ��do����P��q�@E�s��g��* $E�w��B͞�u�{�/����؄�$�#���)W�����P� ~3q��:E��|�!ׯ'ۦ�3��H��غh=�fN���Ŏ��w[�^�n'�7�3�j��ܼ{�:7%���m�P�բI[��޵*����]]o�A}�bƋ^]]�(.7�s��ѳ��z��;)�mo����e4��ɮ���mS࿄~_�����q����0MMoR=`�}�l�����1D�l���,���D�?}ᇒ�bC�Y�nD��B��%'����Q�_�
 �M��8��Q�G|���g�AP'&E��IPv�i�~��P�}��^K���6���䛽m��\��A����ᛇ�ό�c	��å�\ᦩZ�Ǘ-��=ͯo,��Ӏ�nԫI�~�qC�;w}"�FS#b��&�M��"�0��|3+ �(�8rC�|��r�MJA�o�JqnR
�}�1��3�oSЀH䳋h����?����R��      .      x�]�I�$�D�7�R߂������Gd��f5��&�^������_~r���y|�ʿ�?E@��_N�* }�&��Ԡ ?��������q��Y�|t���y������ Zʮ���I対6�Q�T���}�9$�K㓺k�m��{뒦CX�OZm�2$�O~��/R��'��~l�>��YH:���i�N�B�A���7ҙW��������l˞�C��B��<��)��r�|IB�E���hs����؝R���!�jB�}���rmX
fQƟm���O�*f�"��>@���Su,ӱ�B�O��u�(_HV5BI��^g�������K�|~��'P:P�}��˱�%n��[���!��b�˧��z�lQ[��֧�5[h5��[�� ';���J�N��!ێ����3�5�~������{JҪ���I���{l��O�@�@�c@�@%}���t�~���i��\�~F�~Kk���쬀�gh��@��m��[-B:&���ټI��9�˜ǘ|�*ҷ���a�js}v���@�I��,�J��Co0���3ˉ���8X�9����[3Zi�S��.|����v����օY�5=��m�Wz��ܯv��mkUW?Vۓ���轛�}f�4����t���x��yz4��q�2�s�UXsn���ζ)=�`8��G:z�% ��v}�E������Q�nX�zLk��w���me�a�]����!���}M�������P�1@��=��Q$n�u��֏��B�]��3'39�H�-���I�X��t.<d��3w�X���ǖ'3�e��<����$��ߤ����cM��♄1��ж����������_跻��V%1ri�;�(�|9�0�!NvX��"e���d+�~|E7�$Z.�	B�x9�I�$��61s^*�G�bQ��6�������<�[�=���X+�?�Ò�St��+�Gb貼[Bpֈ1_qtYNtr�D��NcK��;0��h:`&j���Q;l�!��ɹ:���ۮ�9߄]�v��"�����"�vذ{$�v�>�"�Y��Gq>�~Eٵ8ʙg�;-ҮŉP��X�V�_t�D���θ�Y�0�'��΀i�b�ڜ�k�~lE�3)�vX5;�w���6;���ڣlM���O���'wvc�i��Κ(��#X+qx�{ۏ���^���t��"�����~��:�/�.G;�./D�G���=��K�I\^��/�I���3-����r��9�s��#�y{��[��x;�DY|�<h�_03( �;����[r��yd�y�ηg��`n���!A���׹
�<n���N�y+�?�V|ފ_S��l������V=V�]k���Ύ)�<��U��`n��~D��.4����5�������Ċ�6wX]��:[�
�B��p?�^s����ϯ��/Y|�0;�Y|ަ��">���X�j�,>oӝq����|,I�t[�s�D��h��f������,���p�C�尽V"�~t����<�叽."���fM���ᅝd�r����Nd9S�A���_����~�S�7��gR��gwN9�r.���LY���3�K0�L�E���]�1�ӫ������)������T���M�O��͝5ΟA�47m��v ���9�ܴ��܅��E�1�
���i��g;�����YF����~��w|3b�������t{��� >��ɜ�y?���wK|�o0m��,>�˅����a�����X�߸�e+��|�P���GL������T|>nP��\|>nuں�ϝ�2?)>�@��7N��:kn��q����;�dc�;�T|>N��,>�+>G_�8 ����W����|� ;���;�x:���X���������q�����G�>��,o�8�E|>�󉺗E|>n|>��E|>��u���;��h[}[�!��|�b������V�w���3Y"U|>NܝL���8q����|L�'u֊�|m�9�����|�~��c9jI���ϋ�|�Ӈ�7��|�D�|I�;�8����=*��1_��L��^�`W��� >wv��V��S�������`Ns��;'���-���'C��t-��Oܽ}X!K�1�G���0R���yy��E|��=c�;�4R���׀>f��_����b	�">wv����{䛊�|v�}�.��1��<�k��">�^#q���s�5��ϝ�=���<q
��iӭ)��|N�c���˶o��ѯ�|������a��50w5��\�q^������|�W�s�Mm��+�$��|��av��b���|�;V}[�">_�܏���i�YĽ��m'��G��<|
;��*�q�Dd�n益��a�[E����h)��~����/�{9g�����y4�h;�n��|���y��Z>Na��pV�?ԯ���n�������$�.��1	�Op�X���v�Qt�pw��2���iMu �t��u֡���Tc��Cc��.��W��\��M�����1;�h`���3��kk���Ğ��^3���
]Pî�c���@�Tq��ݿ�9�*RL�N��AK}T�:`� �ԡy���d������[������L��gF�i;�g˧5m���cIs�r��L�U^��_�h^|-��+�vO=߬���c�kn�����={`���=�|�2S5-�oZ:��l�,�����t�����j����<��O�G�p��\f�,��_K6�o�`�8�5�`�m;x�x�'/��P8K<<7Ų�k���,��$ww`Z��?>Ja�I�??aJ%��=$<=�i�BFځ�V���tC{����;pZ!����w�pT{3�`�y1��&��5�i��kF�;y�VT2�4�TI5���E&��Z�ox�D`���	����b^�٬JJ΁Ŷ��Z�qK��M�,���oVoT�#%�@{j��\s�UU�H�*cWLC�������q�-�UI�$��tdB���7�a��?8�e�$���C�&�J&��-VR�,y7��2�4	��d8�D��'j����CO;5Y�]h:�����mY�o�-XZ�R��h��JP����r�T��Nx�@�I�x&�Z:i�����s��"_�f�Jxp-��K2!��
�#�Ҿ(���[��0Х{�}���8����~(U���?�Ȩ"7��@���VV~���j 7�"�޷��+�+�)��3�u(xE4C��*��
`�yC/8�Zy* wG��2�l�ۑ�r5x8�S`��34�0ǆr��ʾ2%���Z�3��+j�A��)�q�@jup����ގ�C;�EW��;��71�pi�V���Q�� B3DP�D3�ǳ��f(7#fW�qY�/v��l\�r�˜C3_m�zr�K�l�q6��y�Ɖs��oh��r��=�?�iмwc-Kv��*���}�������%��`�,�7�*����j�k�w�f�K�i����0x4Cid��%.2�e�eX��P|CB3_��z�"�e1�2�uC3��G3�P��7��.s8�����!��Ȫ�Be��[��%){InVyw�m{;��΃֜���EC3�P���f(>��4��@R	�f����oN��FC3��D3T�W`��5E�lh��EJ74C%/ZO4C ���fǛ��@�$jh���rhh� ��h��\DR�PC��:B3�e;U�t�;�3�[�������mjh��[L�f����6w��i�;���6����VZ2��0��@�fp��y��}B��ߒ���^��⣡��=�74���ڳ�f� ����hY��f�% \C,s�\��h���8�u�l1���+�5�4���b��f���ߕG38p�<��=n�u�;���9�$P3z��7!����br��-����u4�[P�e��@]��f��.��h��N�|s����o���Zq���]4C+�/Q\�fpͳ����w�� Ҷl4��h�Ҝ���i�sVZ4C(#�z��4x4�{�7����B���B)�<mG3�ݣ�fp����WѰqhWN`���jXy4C��$k7 �  ��W���!�hHh��sz�<��݄��׎4 %�p{�)��;��Ғ9��>�?ߢ��f�75�O2��,��w�ȁ&_;d�<�q�7�I��x����*�]�}aq�o��έ��������4�F6$ft�peW�?��s��M�Y­s/��q��M��=�b�����{�I<+��XZN�s6�p�ʣh�ΞPASG3DPb�'��U��j�O��U�_p����{0S�ό|��f��;Sڱ�\Ӣݎfx�oP3B3�� Ɖf�75���fp��w
h� ��h�P,�������{�fp����!��&�a�,��0|��_-��Oͱ�hW[`�������c]G3\p��u4�-9�^.4C qVhW$`�ώf>5g�k���0.sYP����:�a�,���fp`���f���0|j��fpUV����`�y4�k�W��
��}z���\��f ?�@3�B����p+	v��@3�2�-5�aY�%3�,c�΁f�1�5��8ho5��

��b�X�#4C��l�K�i�hWh`���@���fp�����@�4�+"X�:�-��.�&�p���1���`�l�0��������{���W�o�|S3z�	6�h����n�"H�3���?h����=B38��&%/��&4ü|d52�0/��_h�b�t�)�,�v�fs �f����a6��&�!����0��	~n�@�V10��4C�T�h�y `��@3К� Z�8��	��f��qW�@��aNG(4üuo�2�0=��h��ؠ8l���ơ֥���9���[C3K��f���+4�[p��� h� r��@l�Vr��YB3�K(�ơ։z��H�u�h�T@���3��Gj�.�2��0c����~�4w�=���f�%)��&Г�Y2#� ġE3���[P�@3����a��9Є��{-�G\C<���c��d��u��~C2�ַ8a��t�{���<��f�:�-��a�D�vk�� � h�����͞ߚ|���z��S��в��8Y�u�&��~�q��B��,u�&��3~NI-�[���MJ������I�@ 5��{�kn���=��Rx��U
�/&�$t�yi������|>���0      "   ]   x�%��	�0D�u^�@P۱�]�p!��` �R�MG>q30���0�q<$�e�"p�N�ʰr��Oq��%�Aj�Fd'�j��U�q�oS��~�;      (   �   x�U�1!Dk�K|��x�*E��9�)��)�À�X:�������tK��T�+��$���:I�����t5ws��7u�, �ʄ��Q'���z��Vے���8�Ȥ�{�Δ�i��Z�,�lSuP\i�j��h�}'f����:ss[�X���m:>�-M��[nn��6���Ǻ��
:b����)��Y�`      ,      x�u]K�$9
\�>E��jL�w���9F�ND�P�ժ[!!p����H���i)��$�o��Y�����o�I���uջh�MM����77]�~$}?+������Gʯ��,���d<�k�_���I����O׌��kֻ&{N���[��Y{��s�o�E�����Y��w�w��S����{��m�7O[&?3,K�o�?*���	O��ȯ���n��2{7����YW��'�߼��ت�s.�+C��o��,�./���k���?�� ,K���%|���cY����?uٲ�]�W�WJ��og�ʉ��y�I_,�^;˜���e[��'�}h�=�x�l��loe����?�k׊l�E��/�E�?��z�r�kߖm��g����Ii�ö![4h@_vV�yq���9�١�9�g��K>`ﭞS�3�Rhhϻ�]��G��mgv�J�Y��+�����ٲ~��s�F�7å+��IYv}�Ξ=+��ס�=�����7��+���Nz��7ٲ�ν��������O�O3�Nf���S�XP���]ۋ�Qٮ�\B�#��9�@����W����y�n8����Ůq�Eb�^'߭�������}���uۏmF]mM�/�]o�}臥e���{��Ú�&T�<��#��g{�٪q�ۚ	��ъڣl��Ǟ�Z=�F7zѷ�M����E�I6��]P�	��lv�m�ݟY�������$]�,m}ާ]�oT�� `��绩�|�P������t�Y}����k�}c��g �vB��0�M�`XՁ����+N���ެ��m5����+�m����I��%��>K������Y�,�������$�t��rtg���9�W��3��CW�[�{�����cg��J���pb0�����,�[4�/�%��g����S��e�oI���/���?wc��'��dg9:\�9��^l�~�q>�<٣4����O^@������~?6��{R#+4�)7���'k�T؅u���Lv���vڶ�F��-���+�4��E�l��a�;�[Ip��>j�co��5N�N ��~N���?�w>wn���a�>s�V	������z��!��}��<vm����ͬC谗[�w��ꋷC��O��
��/�˵���}�~=\OI�a�M{�z�Д��Jvד��T<~xQw�t��o箇Pj��l|X?��sI�9��#:�j"j��jg�4��5Ū�l�y�٤�� �5�6�6�����}�O���O�M9O�[$D���+�uPHjiVg���3�Cv����xr��,~��F!��ɸE�eI�f4C�F=w��e6��ւ���N���|���3���c��!biX1�0#���OW3���6��NzW�����%g���+v/��(�%$I]X���y`6 bE!�94`����p%�ﶳ�z�*�[
���z� {7�'������D�c�^	I�<��|��_����rG�8@�0<��dh|(̐�S("���O��#g��b��)~���v�,O�k�&\nE��<�X�g���M��j:�Ǖ�/P�߰̒b0I�z�'�i2eEȑ����-ƌX�������(�MO��i���ت~V�d&�@3�b�*u]��ǽP�,�w�'7đ���q�����x���%/��ǉ��av5A�����G�nV�_��|�� L���h�{��Log �Cʦ�q�;i��m?&�j����H��V�:=���.��2���sH�����L�d'G���^6}|E�!1�N��za��m�nоh���U�h��F�ټ1�J_����T�izF�ӈ�`��j�Xw�g�a��߫���8�Yv�p�(��f��H���̈)^�1Eai��""��>7۶(�ae���uM�P42&�U1��a%}�F�L�ڧ6e|��%~�9Ս�x!�����J�<�d<�2@R�q��A��{S �16@��1c]����$R��������.��r$�S9��O���E��A�I��k �P�S��m���h�mX���&:-)���w���H���H즐�����|`LDx��ZE��&_I�C���x�:������f(-J?�բN�3B\�@�4������YA6����&3��N�Ӝ{,���w��N��옯���G�����q4)[�{�'��]��W�s��W�<�w���Xq5�nV2�r�#1�o#Q������"C��j�i�*@*F���"�fW/[�r^7h�u��}��5��A��vX^L�r�o���j��.���'(kFy�+99WOQ.���L�������p��Ԋ�wq�	&R�lp����%��1٫}y�����*��m]M7Ԑ����l�?!am���yC��sa�8��}a�������Ъ3w��:��:V���-��P��Au9� �5�厶���=���%��0%�djTw���83�e��tn+v����%�����^s}\�V"�n�Bk<��b�?���v������qJ��q�R��|�dւ��vX�L�B��f�2�niPD��{�yRb�ѓ���[���>V{���JX^�h���O+|����}|�b����*�c�-���E&����{4�O����&+Ci�Q�ȥ&�l�P�JƟv��4�{5_BE�����I�:+&��P��T�ln���1� x�L��G;�Hs<��G?jx�H�|�8�"�FЩO}7�Xa�������%����<a��n��Pe�� /����j��'@�|�VŲP�/`)�\9a�&�qؓy"J���x#�S��?�|[�ʛ��4���7EY�u�Iy�3��^h��r�5�h���%� H*����@����.%",l��4K9�,��i[��X�V�k$�4 �n�����uu:t�;��8� ��O)��c��*x�q.={��"�%Ѹ�ɫ���Τ�4�q��h%ՠy��D��|ى�%c��͛�T�L�$5������{]��6�mX>��\��~1o��a��˅�G�5�:���a�,��}m�S�W�s|j�.i2��g�_��-Fw,��scT��ǖH�[��NQj��ח�'�=)@ٙ�w�Q�����W��<�b{D4�$��'�I�$Bq����X�V���o �_�Ś���]}g�7��XE�em���<��A�V+�l�g�)����X�:��pJz�x��R�T`�_�����Db#xZ�-)������b�K9)2
�u���VNl����SM>�#�"ꨣ�ώxɊ�;b���̛�bS�	x��P�'�,b]M��@A�Je�STP�{�Q Bi����ۺj%����e''�
<������1�BZZD�P�y��T���5yҀ/�g2|��|o�2�g�]�S�(�])|m�PVZw_�a|�Q[#�^ڼ"�l�G�Yw�=�a�[����	�c�^+���Z��'���4��#֕(lh�*������PT2蕈��_Q�aV}���ǥ�:�Y4u�I�>~�|RW5S�5����O���]
�x�=$��Q�I鶥��VF�)!�5m0R�2N|�*)��3�e������@�{eK����[�P��b���I&�����BO�(1b���]5}R�4��Ijh�V.�YxhlyU��lP�o���a��@�ȫ�e��?�V�ฺYn���R���8�~�& ���>�I���lP+�\g������Mk&����T��>��Z'סi=�ى��(}���u�����ϝ��Y5ov�\��r�=�~�Q �A ����B��{����2�Ý(u>\���}+��	U��Mg��X9S!	��`��#ße�B�L�]�@D�)��5u�ΙUI�����iN�(�����W7`구�v���N�
d)��6Z����\B�v��^%�&3?c���2sR���ZU|�	q٨	|n>5�S�V#^.�qZ>C�KtQ�}���i��\���u�����Z�&VӢݳ#���!�r����4���L/,���L6^}���i�t��������
/-�:�xn�QdM��5��Rd-�ӹV%�����O#[A�G�/�h�M1P�nQ�n�\-ؘ_    ��ZNG����C���%��ѡ���Z.}��-d/��zRR�5��:|h!�Z�����m+�f������(��ᵎ��R�Y��>���4�2��u�Z�,g��a]�jhT[ؘ�Ֆ���h�[����(�Vv�{��Ś>�*�s����vi_A�T�Xyk�G��d�V��o;�,��V�Ϝ���|�V~�5#�yaa#�ܛ�2���Z�~��I�lL_��/"f!���mo���j�̔��ѻ��:I�i�bm�"�a�[�ͮ�R��k�I3!�&�/��G��ck� e]7�>C��v�9bN!�P�i��f�w(�.�A���rA#h�z/��&��&�xd�u��y�r�{��0we���+_���Kó�k��xK�a���p�<��L�L���6K�\VrAR��F|�	Wˇn������C-U]�7Z������+Xu�u�#ޘJY�.|z��<����.�4�fY���MqY�	S�
Wt�;&L8�@�<D��5d��k�����&4xݜ����������Zl�Q�W��h��	`+[��K��J~�
���� 7�lT�W��do~]޶����4�c�	���,����4�$z�����灷-�]�rEX�F�ҩ;F��j���B���B K�0I?'7�$�i��D�*�&�@Jդ\�8T
���{r
>�'hb�s�ػP���I��{MW]�Uh��ga�"<E0�����P�4(�ײ�$y�����0��JW$'�[��Բ+ܬ�^��seCj/����e��a��7ZH��F5F�}ܼ�F�����/E��2�f�ޝ��U��ޫ���vEBw�bW��E׶���"�`�&zS��X�p&�+���Y#qXh����!�LH��E+=V��nf"#��#Z:��h�W�ɧ�j�`S�q8n��J��/�e]Kު�~��.7'�C��I��4�Äk�r�������(Yp#���A�QV'���/&0�� ¶��ȑ�z�Ώb�6��,Zz�� �N[;3:�,����ڙ.#G7hZ\��Z	Τ���ZQ��N^|?L;�v�ӈ���kk�;���;C��`���#T�M3�B�z�@��f�ƹz�K7�ް� !d� ��?[?'�ƶ�ܙ�����wY%���~�83YJ��9����?a���8���s'燪��!oVW�ؘ����R�Y�dN�)u]s�;�M�>Ͽ�pG=B� �U�v�7g$����	6G%�a�LW��2���=_	�a�{�����}zb͖vf��Yo��"'��r�f���M���<i3@hj*��D�����C�6oڜwȋr�Sm����g��kw �b\Q�n ��$����z�Fw���Җ^����%m�O�G-��Nƴ��]���yp;�l�`�I�֜���)�[q{�UK��������_�/�t���F�L'�b(� ��4�d��AM���������4�$�$=�<��g��ɷ'
V�*|C9�����������1(	C����"u{^!��
T��i[����K�xy���tO�rxk�e.�9���d2��ڕK¾|�����I4�d�O"_�d��q�(N�����p]T:|ϑ29����9>r<O�{����So������(uq:�O��s��<�6�B\/-��'j%'���+�-#?�F�*uzV�}}c��,��]}�7־@�F���49�$�Go�6���j�uFR�b
���K�{�$)e3
ru�_����
`�^ǵi�)��]���ًS5���뺻�d��g�-��d�A.M�p"M.e��C/����9}h��u����-��|�~ [W�'����g�����;�m};)ju�(��q�Kg�8���:���/W��O?V�%j �(����g�n  �x@�q(W�P6����S��c'��g��7?�3u���n��:1�!s�O�Ƴ(��(�:�|�v�;A(����J�7��3e�S��1q*h��ɜ���~e\���O�Ƥ���sA���|�IQqF�_8g��7b�u7&�٘[8㔢Đ!�����@�w3�W��g�9�pѻ)�g;7���stSqy�^��\~����EH�4������hqml��"k�Ѽ�����$&#�D�Y�e ��������,�}jt���ꌮ�պ%��և�%�������j����z�ԧ>�a�8�uV�e��O_�L4Q1NB�;ܑҷf�d�G
ZQ�{w��9�+Ȇ�h+g���756���Y ������7Tr�1F:�%�tj��y�X�^�x	T�H!�f��13�r�
z�8L$�2X���A�U�x3�,<5�g��n��e�a����d;�{��3C�W�@�\g�ۧQu�]9�Y��u#��;��I����j��7�өc��!v�r2B��8���y���!
�m�I[ߑZ��v��aQ(����e�=�>(����Qξ�D��L�����O�Ӫ�
:��o�q�b�T�գ\ӧə!r!�v�����G\'��D��_�$��8j�Y�Q�LA$*h�U�DYg!��d2\�+Q�b߻�B�|�˨�x�;���45����ڭ��=<��a�g����.��kv��w*2�Vx�]�~�o���r�Y��+7g#1�F����muՏ�o�j	�#�>z��h����=�*�������$5Qn�ﶨJ0�]��48�1TX��>��{��Į,g����Z�je�l�V�"�X�U7J�ǻә�YJ������=�C(�gi1�1��W�4��r�����J����ʥFn�S��,�t��L��F�J�0��%�l$Is��g�) �����Ǽ�'�ٌw?�2�q80��Ψqj�t��z�x����Z��I\��h8����1�A��C䝹1�Lg�@��z�7f�TTĢu�x��y2NqQݘa4=�߼?~���ݓc,;�<������2b�`7r��࿕N���Y��1�m�Pb/8�4��������&�c�����C��������3�)��� �t�2k��p���f!�}��wpD2�|2�L��6}.]���er�-��SZS�5�Be������C��O������Վ'��3%��Ku<�H����\�O�*��jS�9U�2��ŗe�4]�V����>A�O��Q�mT:z�kSbcf� N�/טO���G�g�� T��Ж˲��!9@8�<n����{�9�i��4�;�q�r�A�FzL�hB����x������L�:q3��*�Β|X��G��yx����;�vB�}#��~Aa˨ɽ�狥�E����g��Ǵrp�m���YF�F�e����3��qd6�������5��q�F�ct5ڀ���m�7�L��l��Y��-L+)&vu�|P�I5��[]����u$L��Etb��H�X��f]�љ��z��7EiD)�af`��A�闵]��h~���g,�lA��������1�ε�@c�Hg)�l��Y�j<��3�'D�����2��*:��g_�p. +C��"��z��`eg���yV�4�%@	���{��g�/�'������>�l��X�8�~�c�������@_q»��'}?)>�P���#f�eu>�"�E4aB#�͑/m���Y��+6�Y#ޠ���9β�x.a��7灚���D�q�|�f���4�1�L�W���lhN��saMi���C/�{�v�=����!$�}�ܔyTQ}��K �<7/{�C��71g v+;�}ޚu���Lʥ��7 ��Y��#^�&��Ԇ=���2��y��檗D"�Ϲ�F¥����ߨ��}�\��nE�A)�8�X)��R��Hc ��������]���;�2փ���"M�����O6M<��J7}I����V:�Ҝ��w��t*ͅ!�y�ĒK�%�p�����6�,���W�\�h&3�|�����X��"�z�$�U}?�3dNKV�D�aN��{�t+<U�1���K�>D����Qm�(��� 9]�N�y�NZyc�3�Ëu0%�[�{V^u�&���uSg�p�`r (  ڝ+�z���lzV�R�3����W��G��IBk(���@$�8���n��n�i�ؼ��e}_ZW�>S|W�%�(}ظTo��q9(z+�
�J�=��^jd�p���E���_�����G��'8�z�c��c�w�����u�nm���"��7'��37j��&��*u�,�]�`X�ae��g]��-�d�k���|�1a/�3�d�q��%�КrU��ʯ�$��t�'���^�	����gU6���������3����~�o�nr}m����A���o�?ِ	,l�G�!�(
��?���s1��ſR�S��8gVA� ��|�5�1��#F��k����*��#����R�o	��Q7*���w{FX+b��2ם	85���	 �f�r�V9N�g�]�g�2-�W��<'j~ �⣔�<�x�;>�}^J���ay �׌✧��m�-e]L��_�k��P�����6O+�u�>����Z�2Uq}_L���{zTN�cXԨp�묐�/#{��Z�R4���e:M ����$P���t�������?���      #   6  x�]Vۍ9�6�̉�#������mO��Ү�+EQ K����ù��wy�͈O�.�F��~���ݝ�r�l�6�m�PN�d%_~����)��#L��z���Q�*\F��z��I(;���N��5�l���(V����@�ϳ��r�Ӭ9� �<1ed�E[Ix���#��2O�,���}�[��C�%'n?�ȩ���Y�G��"57T"$�����\�Y'��&$#�K���Vi�����<x�NM��ͮ���Ԓz[��xw�Z#�^��������5� �[�\����9a��6���i���8`G
Ⱦ܊�te����x���h	��jל`��xO�d#d~���Y���@h�a��x�x!��5^��LZ�〬nl|�P��'��0���?2=�^�NW'Dӹ�uSK�%�2^�n �ht�,�~\��qqpi���t��u: 4�Ȳ �P����{�Ç��|�����H�FS+�bY܎��w����Yb�^"�z����j�5�3�f�g�1����5�Z%@���.���i�h���v�H��C�
�fY./������#P#���`���A�丱�b�30�!f��}
����l5�X���3��M8���ͱ�tx>
�Y6��ky��%6Q����`�K�#�&�1��t�T<�=֐�
Ƽ�<?uC�]��� �ON�����A��˵/,���4��yo���2����T���y_0
�K��ږ�m.t�'�yA�;D�A������г`�T�!}ȼ�ޛ޷�bvG�J1h�5�{��lq�d��f��L��)����~��5c��jJŴ_��]Ǜ3���V�5�5c�(�+}���0���z���jݺѱ��|J,��9�g��}Ae(�CW����`gc�1+ȼ��m�\u0�G)g�O��&*C�* �x�;�Ia�16tR	V��:����Q�*}�zU\�z,�2ѯ��Pނ���W}�������2U��wO��p����B�[�G<��2P=����ۡ|��L��n��Oa��լ��5�D��f4�w�!2�A�P�jyW�=-
,��{��2m��8�4R�|�v�Mn�%���OzN�k+\6L��G�K���q~u���P�$��c���zG0<��<5�����M� k(|����?�aM%�41xQ;r���0D#k���`�K��F!��;�=�R/��68���jÊǲ���=k���1��o<�R��;v����I.4���<�aw�4��;�|3�h���:�q���$$s���aT����v/z���������{�1          �   x�eP��0�N�� 	X�aڂ 	D�	�A(
��
獸�C|8����9=�-j�	gIZ4^�O;&%ӻÅ��:��	M�cK�#��oo�kIe�J�Qd�R�X�T�&H��쵞Ȍ�����?��je�M5Ǉǁ�2��џ�?x'����L�+dΞ�׉���E�����VT'!.� գ�hn����z�l?ٲC������VK�cy�:�?�i��v�� %.G      !      x������ � �     