
CREATE SCHEMA chat;


--
-- TOC entry 11 (class 2615 OID 34055)
-- Name: main; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA main;


--
-- TOC entry 9 (class 2615 OID 34056)
-- Name: storage; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA storage;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 215 (class 1259 OID 34106)
-- Name: _prisma_migrations; Type: TABLE; Schema: chat; Owner: -
--

CREATE TABLE chat._prisma_migrations (
    id character varying(36) NOT NULL,
    checksum character varying(64) NOT NULL,
    finished_at timestamp with time zone,
    migration_name character varying(255) NOT NULL,
    logs text,
    rolled_back_at timestamp with time zone,
    started_at timestamp with time zone DEFAULT now() NOT NULL,
    applied_steps_count integer DEFAULT 0 NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 34113)
-- Name: messages; Type: TABLE; Schema: chat; Owner: -
--

CREATE TABLE chat.messages (
    id text NOT NULL,
    content text NOT NULL,
    "roomId" text NOT NULL,
    sender_id text NOT NULL,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 34119)
-- Name: recordings; Type: TABLE; Schema: chat; Owner: -
--

CREATE TABLE chat.recordings (
    id text NOT NULL,
    call_session_id text NOT NULL,
    file_path text NOT NULL,
    start_time timestamp(3) without time zone NOT NULL,
    end_time timestamp(3) without time zone,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(3) without time zone NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 34125)
-- Name: rooms; Type: TABLE; Schema: chat; Owner: -
--

CREATE TABLE chat.rooms (
    id text NOT NULL,
    privated boolean DEFAULT false NOT NULL,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(3) without time zone NOT NULL,
    seller_id text NOT NULL,
    customer_id text NOT NULL
);


--
-- TOC entry 219 (class 1259 OID 34132)
-- Name: video_sessions; Type: TABLE; Schema: chat; Owner: -
--

CREATE TABLE chat.video_sessions (
    id text NOT NULL,
    "roomId" text NOT NULL,
    start_time timestamp(3) without time zone NOT NULL,
    end_time timestamp(3) without time zone,
    participants text[],
    recording_url text,
    duration integer,
    status text DEFAULT 'active'::text NOT NULL,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(3) without time zone NOT NULL
);


--
-- TOC entry 220 (class 1259 OID 34139)
-- Name: account_roles; Type: TABLE; Schema: main; Owner: -
--

CREATE TABLE main.account_roles (
    id character varying(255) NOT NULL,
    created_date timestamp(6) without time zone NOT NULL,
    updated_date timestamp(6) without time zone NOT NULL,
    enabled boolean NOT NULL,
    account_id character varying(255) NOT NULL,
    role_id character varying(255) NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 34144)
-- Name: accounts; Type: TABLE; Schema: main; Owner: -
--

CREATE TABLE main.accounts (
    id character varying(255) NOT NULL,
    created_date timestamp(6) without time zone NOT NULL,
    updated_date timestamp(6) without time zone NOT NULL,
    email character varying(255) NOT NULL,
    enabled boolean NOT NULL,
    hash_password character varying(255) NOT NULL,
    join_in_date timestamp(6) without time zone NOT NULL,
    locked boolean NOT NULL,
    secret character varying(255) NOT NULL,
    username character varying(255) NOT NULL,
    two_fa boolean NOT NULL,
    changed_username boolean DEFAULT false NOT NULL,
    last_login timestamp(6) without time zone,
    balance numeric(38,2) DEFAULT 0.0000
);


--
-- TOC entry 222 (class 1259 OID 34150)
-- Name: brand_categories; Type: TABLE; Schema: main; Owner: -
--

CREATE TABLE main.brand_categories (
    brand_id character varying(255) NOT NULL,
    category_id character varying(255) NOT NULL
);


--
-- TOC entry 223 (class 1259 OID 34155)
-- Name: brands; Type: TABLE; Schema: main; Owner: -
--

CREATE TABLE main.brands (
    id character varying(255) NOT NULL,
    created_date timestamp(6) without time zone NOT NULL,
    updated_date timestamp(6) without time zone NOT NULL,
    description character varying(255),
    enabled boolean,
    img_url character varying(255),
    name character varying(255)
);


--
-- TOC entry 224 (class 1259 OID 34160)
-- Name: categories; Type: TABLE; Schema: main; Owner: -
--

CREATE TABLE main.categories (
    id character varying(255) NOT NULL,
    created_date timestamp(6) without time zone NOT NULL,
    updated_date timestamp(6) without time zone NOT NULL,
    description text,
    enabled boolean NOT NULL,
    name character varying(100) NOT NULL,
    visible boolean NOT NULL,
    parent_id character varying(255)
);


--
-- TOC entry 225 (class 1259 OID 34165)
-- Name: categories_backup; Type: TABLE; Schema: main; Owner: -
--

CREATE TABLE main.categories_backup (
    id character varying(255),
    created_date timestamp(6) without time zone,
    updated_date timestamp(6) without time zone,
    description text,
    enabled boolean,
    name character varying(100),
    visible boolean,
    parent_id character varying(255)
);


--
-- TOC entry 255 (class 1259 OID 34696)
-- Name: customer_bank_infos; Type: TABLE; Schema: main; Owner: -
--

CREATE TABLE main.customer_bank_infos (
    id character varying(255) NOT NULL,
    created_date timestamp(6) without time zone NOT NULL,
    updated_date timestamp(6) without time zone NOT NULL,
    account_number character varying(20) NOT NULL,
    bank_name character varying(128) NOT NULL,
    user_bank_name character varying(128),
    customer_id character varying(255) NOT NULL,
    bank_bin character varying(20) NOT NULL
);


--
-- TOC entry 226 (class 1259 OID 34170)
-- Name: customer_contacts; Type: TABLE; Schema: main; Owner: -
--

CREATE TABLE main.customer_contacts (
    id character varying(255) NOT NULL,
    created_date timestamp(6) without time zone NOT NULL,
    updated_date timestamp(6) without time zone NOT NULL,
    country character varying(20) NOT NULL,
    customer_name character varying(50) NOT NULL,
    defaulted boolean DEFAULT false NOT NULL,
    district character varying(50) NOT NULL,
    name character varying(50) NOT NULL,
    phone character varying(12) NOT NULL,
    state character varying(50) NOT NULL,
    type integer NOT NULL,
    ward character varying(50) NOT NULL,
    customer_id character varying(255) NOT NULL,
    address_line character varying(255) NOT NULL
);


--
-- TOC entry 227 (class 1259 OID 34176)
-- Name: customers; Type: TABLE; Schema: main; Owner: -
--

CREATE TABLE main.customers (
    id character varying(255) NOT NULL,
    created_date timestamp(6) without time zone NOT NULL,
    updated_date timestamp(6) without time zone NOT NULL,
    address text,
    avatar_url text,
    first_name character varying(255),
    last_name character varying(255),
    phone character varying(20),
    account_id character varying(255) NOT NULL,
    gender integer DEFAULT 1 NOT NULL
);


--
-- TOC entry 228 (class 1259 OID 34182)
-- Name: customers_contacts; Type: TABLE; Schema: main; Owner: -
--

CREATE TABLE main.customers_contacts (
    customers_id character varying(255) NOT NULL,
    contacts_id character varying(255) NOT NULL
);


--
-- TOC entry 229 (class 1259 OID 34187)
-- Name: login_sessions; Type: TABLE; Schema: main; Owner: -
--

CREATE TABLE main.login_sessions (
    id character varying(255) NOT NULL,
    created_date timestamp(6) without time zone NOT NULL,
    updated_date timestamp(6) without time zone NOT NULL,
    device_fingerprint character varying(255),
    device_name character varying(255),
    ip_address character varying(15) NOT NULL,
    location character varying(255),
    login_time timestamp(6) without time zone NOT NULL,
    user_agent character varying(255),
    account_id character varying(255) NOT NULL
);


--
-- TOC entry 230 (class 1259 OID 34192)
-- Name: order_combo_deliveries; Type: TABLE; Schema: main; Owner: -
--

CREATE TABLE main.order_combo_deliveries (
    id character varying(255) NOT NULL,
    created_date timestamp(6) without time zone NOT NULL,
    updated_date timestamp(6) without time zone NOT NULL,
    delivery_code character varying(255) NOT NULL,
    delivery_type character varying(255) NOT NULL,
    order_combo_id character varying(255) NOT NULL,
    CONSTRAINT order_combo_deliveries_delivery_type_check CHECK (((delivery_type)::text = ANY (ARRAY[('MANUAL'::character varying)::text, ('GRAB'::character varying)::text, ('GIAO_HANG_TIET_KIEM'::character varying)::text, ('VIETTEL_POST'::character varying)::text])))
);


--
-- TOC entry 231 (class 1259 OID 34198)
-- Name: order_combos; Type: TABLE; Schema: main; Owner: -
--

CREATE TABLE main.order_combos (
    id character varying(255) NOT NULL,
    created_date timestamp(6) without time zone NOT NULL,
    updated_date timestamp(6) without time zone NOT NULL,
    grand_price numeric(38,2) NOT NULL,
    order_destination_id character varying(255) NOT NULL,
    order_status_id character varying(255) NOT NULL,
    seller_id character varying(255) NOT NULL,
    cancelled_reason character varying(255),
    date_create_reason timestamp(6) without time zone
);


--
-- TOC entry 232 (class 1259 OID 34203)
-- Name: order_destinations; Type: TABLE; Schema: main; Owner: -
--

CREATE TABLE main.order_destinations (
    id character varying(255) NOT NULL,
    created_date timestamp(6) without time zone NOT NULL,
    updated_date timestamp(6) without time zone NOT NULL,
    address character varying(500),
    country character varying(20),
    customer_name character varying(255) NOT NULL,
    district character varying(20),
    phone character varying(12) NOT NULL,
    state character varying(20),
    ward character varying(20),
    order_id character varying(255) NOT NULL,
    address_line character varying(500)
);


--
-- TOC entry 233 (class 1259 OID 34208)
-- Name: order_histories; Type: TABLE; Schema: main; Owner: -
--

CREATE TABLE main.order_histories (
    id character varying(255) NOT NULL,
    created_date timestamp(6) without time zone NOT NULL,
    updated_date timestamp(6) without time zone NOT NULL,
    notes text,
    status boolean NOT NULL,
    order_combo_id character varying(255) NOT NULL,
    seller_id character varying(255) NOT NULL,
    current_order_status character varying(255) NOT NULL,
    new_order_status character varying(255) NOT NULL,
    old_order_status character varying(255) NOT NULL
);


--
-- TOC entry 234 (class 1259 OID 34213)
-- Name: order_items; Type: TABLE; Schema: main; Owner: -
--

CREATE TABLE main.order_items (
    id character varying(255) NOT NULL,
    created_date timestamp(6) without time zone NOT NULL,
    updated_date timestamp(6) without time zone NOT NULL,
    background_url character varying(256) NOT NULL,
    base_price numeric(38,2) NOT NULL,
    product_name character varying(128) NOT NULL,
    short_description text NOT NULL,
    unit character varying(10) NOT NULL,
    order_id character varying(255) NOT NULL,
    order_combo_id character varying(255) NOT NULL,
    product_id character varying(255) NOT NULL,
    quantity integer DEFAULT 1 NOT NULL
);


--
-- TOC entry 235 (class 1259 OID 34219)
-- Name: order_statuses; Type: TABLE; Schema: main; Owner: -
--

CREATE TABLE main.order_statuses (
    id character varying(255) NOT NULL,
    created_date timestamp(6) without time zone NOT NULL,
    updated_date timestamp(6) without time zone NOT NULL,
    code character varying(20) NOT NULL,
    enabled boolean NOT NULL,
    name character varying(50) NOT NULL
);


--
-- TOC entry 236 (class 1259 OID 34222)
-- Name: orders; Type: TABLE; Schema: main; Owner: -
--

CREATE TABLE main.orders (
    id character varying(255) NOT NULL,
    created_date timestamp(6) without time zone NOT NULL,
    updated_date timestamp(6) without time zone NOT NULL,
    discount_total numeric(38,2) NOT NULL,
    grand_total numeric(38,2) NOT NULL,
    shipping_total double precision NOT NULL,
    sub_total numeric(38,2) NOT NULL,
    tax_total numeric(38,2) NOT NULL,
    customer_id character varying(255) NOT NULL
);


--
-- TOC entry 237 (class 1259 OID 34227)
-- Name: payment_histories; Type: TABLE; Schema: main; Owner: -
--

CREATE TABLE main.payment_histories (
    id character varying(255) NOT NULL,
    created_date timestamp(6) without time zone NOT NULL,
    updated_date timestamp(6) without time zone NOT NULL,
    payment_code character varying(20),
    payment_content character varying(1024),
    payment_status character varying DEFAULT 'CREATED'::character varying NOT NULL,
    payment_time timestamp(6) without time zone,
    payment_total numeric(38,2) NOT NULL,
    order_id character varying(255) NOT NULL,
    payment_method_id character varying(255) NOT NULL,
    CONSTRAINT payment_histories_payment_status_check CHECK (((payment_status)::text = ANY (ARRAY[('CREATED'::character varying)::text, ('CANCELED'::character varying)::text, ('PAID'::character varying)::text, ('EXPIRED'::character varying)::text])))
);


--
-- TOC entry 238 (class 1259 OID 34234)
-- Name: payment_methods; Type: TABLE; Schema: main; Owner: -
--

CREATE TABLE main.payment_methods (
    id character varying(255) NOT NULL,
    created_date timestamp(6) without time zone NOT NULL,
    updated_date timestamp(6) without time zone NOT NULL,
    callback_uri character varying(255) NOT NULL,
    code character varying(50) NOT NULL,
    description character varying(500) NOT NULL,
    enabled boolean DEFAULT true,
    handler_class character varying(255) NOT NULL,
    img_url character varying(255) NOT NULL,
    name character varying(50) NOT NULL,
    type character varying(255) NOT NULL
);


--
-- TOC entry 239 (class 1259 OID 34240)
-- Name: product_categories; Type: TABLE; Schema: main; Owner: -
--

CREATE TABLE main.product_categories (
    product_id character varying(255) NOT NULL,
    category_id character varying(255) NOT NULL
);


--
-- TOC entry 240 (class 1259 OID 34245)
-- Name: product_price_histories; Type: TABLE; Schema: main; Owner: -
--

CREATE TABLE main.product_price_histories (
    id character varying(255) NOT NULL,
    created_date timestamp(6) without time zone NOT NULL,
    updated_date timestamp(6) without time zone NOT NULL,
    from_date timestamp(6) without time zone NOT NULL,
    new_price numeric(38,2) NOT NULL,
    old_price numeric(38,2) NOT NULL,
    product_id character varying(255) NOT NULL,
    update_date timestamp(6) without time zone NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 34250)
-- Name: product_reviews; Type: TABLE; Schema: main; Owner: -
--

CREATE TABLE main.product_reviews (
    id character varying(255) NOT NULL,
    created_date timestamp(6) without time zone NOT NULL,
    updated_date timestamp(6) without time zone NOT NULL,
    content character varying(255) NOT NULL,
    status boolean NOT NULL,
    vote double precision NOT NULL,
    customer_id character varying(255) NOT NULL,
    product_id character varying(255) NOT NULL,
    order_combo_id character varying(255) NOT NULL,
    helpful double precision,
    image_review character varying(255)[],
    reply_content character varying(255),
    reply_created_date timestamp(6) without time zone,
    reply_updated_date timestamp(6) without time zone,
    order_id character varying(255) NOT NULL,
    seller_id character varying(255) NOT NULL
);


--
-- TOC entry 242 (class 1259 OID 34255)
-- Name: products; Type: TABLE; Schema: main; Owner: -
--

CREATE TABLE main.products (
    id character varying(255) NOT NULL,
    created_date timestamp(6) without time zone NOT NULL,
    updated_date timestamp(6) without time zone NOT NULL,
    current_price numeric(38,2) NOT NULL,
    description text,
    model character varying(128) NOT NULL,
    name character varying(255),
    img_urls character varying(255)[],
    short_description text,
    tags character varying(255)[],
    thumbnail character varying(256),
    verified boolean NOT NULL,
    seller_id character varying(255) NOT NULL,
    enabled smallint DEFAULT 0 NOT NULL,
    avg_vote numeric(5,2) DEFAULT 0.00 NOT NULL,
    condition smallint DEFAULT 0 NOT NULL,
    quantity integer DEFAULT 0 NOT NULL,
    status smallint DEFAULT 0 NOT NULL,
    warranty_expiry_date date,
    product_parent_id character varying(255),
    brand_id character varying(255) NOT NULL,
    CONSTRAINT products_condition_check CHECK (((condition >= 0) AND (condition <= 5))),
    CONSTRAINT products_enabled_check CHECK (((enabled >= 0) AND (enabled <= 4))),
    CONSTRAINT products_status_check CHECK (((status >= 0) AND (status <= 4)))
);


--
-- TOC entry 243 (class 1259 OID 34268)
-- Name: report_sellers; Type: TABLE; Schema: main; Owner: -
--

CREATE TABLE main.report_sellers (
    id character varying(255) NOT NULL,
    created_date timestamp(6) without time zone NOT NULL,
    updated_date timestamp(6) without time zone NOT NULL,
    content text NOT NULL,
    image character varying(255),
    resolution_date timestamp(6) without time zone NOT NULL,
    resolution_detail text NOT NULL,
    resolution_status text NOT NULL,
    type_report text NOT NULL,
    seller_id character varying(255) NOT NULL,
    admin_id character varying(255) NOT NULL,
    customer_id character varying(255) NOT NULL,
    product_id character varying(255) NOT NULL,
    order_id character varying(255) NOT NULL
);


--
-- TOC entry 244 (class 1259 OID 34273)
-- Name: roles; Type: TABLE; Schema: main; Owner: -
--

CREATE TABLE main.roles (
    id character varying(255) NOT NULL,
    created_date timestamp(6) without time zone NOT NULL,
    updated_date timestamp(6) without time zone NOT NULL,
    code character varying(255) NOT NULL,
    name character varying(255) NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 34278)
-- Name: sellers; Type: TABLE; Schema: main; Owner: -
--

CREATE TABLE main.sellers (
    id character varying(255) NOT NULL,
    created_date timestamp(6) without time zone NOT NULL,
    updated_date timestamp(6) without time zone NOT NULL,
    avatar_url character varying(256),
    back_side_identity_card character varying(256),
    background character varying(256),
    description text,
    email character varying(50) NOT NULL,
    front_side_identity_card character varying(256),
    identity_number character varying(20) NOT NULL,
    phone_number character varying(12) NOT NULL,
    shop_name character varying(50) NOT NULL,
    verified boolean NOT NULL,
    account_id character varying(255) NOT NULL,
    identity_verified smallint DEFAULT 0 NOT NULL,
    address_line character varying(100) NOT NULL,
    district character varying(50) NOT NULL,
    ward character varying(50) NOT NULL,
    state character varying(50) NOT NULL,
    avg_vote double precision,
    CONSTRAINT sellers_identity_verified_check CHECK (((identity_verified >= 0) AND (identity_verified <= 3)))
);


--
-- TOC entry 246 (class 1259 OID 34286)
-- Name: third_party_authentications; Type: TABLE; Schema: main; Owner: -
--

CREATE TABLE main.third_party_authentications (
    id character varying(255) NOT NULL,
    created_date timestamp(6) without time zone NOT NULL,
    updated_date timestamp(6) without time zone NOT NULL,
    provider character varying(255),
    provider_email character varying(255),
    provider_id character varying(255)
);


--
-- TOC entry 256 (class 1259 OID 34708)
-- Name: transactions; Type: TABLE; Schema: main; Owner: -
--

CREATE TABLE main.transactions (
    id character varying(255) NOT NULL,
    created_date timestamp(6) without time zone NOT NULL,
    updated_date timestamp(6) without time zone NOT NULL,
    amount numeric(38,2),
    type character varying(255),
    account_id character varying(255) NOT NULL,
    order_combo_id character varying(255),
    CONSTRAINT transactions_type_check CHECK (((type)::text = ANY ((ARRAY['WITHDRAW'::character varying, 'HOLD_RELEASE'::character varying, 'EARN'::character varying])::text[])))
);


--
-- TOC entry 257 (class 1259 OID 34716)
-- Name: withdraw_requests; Type: TABLE; Schema: main; Owner: -
--

CREATE TABLE main.withdraw_requests (
    id character varying(255) NOT NULL,
    created_date timestamp(6) without time zone NOT NULL,
    updated_date timestamp(6) without time zone NOT NULL,
    amount numeric(38,2) NOT NULL,
    bank_account character varying(20) NOT NULL,
    bank_bin character varying(10) NOT NULL,
    notes text,
    processed_date timestamp(6) without time zone,
    prove_image_url character varying(255),
    status smallint NOT NULL,
    user_bank_name character varying(128) NOT NULL,
    account_id character varying(255) NOT NULL,
    qr_code_url text,
    CONSTRAINT withdraw_requests_status_check CHECK (((status >= 0) AND (status <= 2)))
);


--
-- TOC entry 247 (class 1259 OID 34291)
-- Name: media_files; Type: TABLE; Schema: storage; Owner: -
--

CREATE TABLE storage.media_files (
    id character varying(255) NOT NULL,
    created_date timestamp(6) without time zone NOT NULL,
    updated_date timestamp(6) without time zone NOT NULL,
    download_count bigint,
    file_size bigint NOT NULL,
    file_url text NOT NULL,
    is_public boolean NOT NULL,
    original_name character varying(255) NOT NULL,
    stored_name character varying(255) NOT NULL
);


--
-- TOC entry 248 (class 1259 OID 34296)
-- Name: video_streams; Type: TABLE; Schema: storage; Owner: -
--

CREATE TABLE storage.video_streams (
    id character varying(255) NOT NULL,
    created_date timestamp(6) without time zone NOT NULL,
    updated_date timestamp(6) without time zone NOT NULL,
    bitrate integer,
    description text,
    duration_seconds bigint,
    error_message text,
    file_size bigint,
    format character varying(20),
    owner_id character varying(36),
    processing_progress integer,
    resolution character varying(20),
    source_service character varying(100) NOT NULL,
    status character varying(20) NOT NULL,
    stored_file_url text,
    stream_url text,
    thumbnail_url text,
    title character varying(255) NOT NULL,
    CONSTRAINT video_streams_status_check CHECK (((status)::text = ANY (ARRAY[('ACTIVE'::character varying)::text, ('INACTIVE'::character varying)::text, ('PROCESSING'::character varying)::text, ('COMPLETED'::character varying)::text, ('FAILED'::character varying)::text])))
);


-- Completed on 2025-07-18 04:07:02 UTC

--
-- PostgreSQL database dump complete
--

