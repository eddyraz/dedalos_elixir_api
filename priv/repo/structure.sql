--
-- PostgreSQL database dump
--

-- Dumped from database version 15.0
-- Dumped by pg_dump version 15.1 (Debian 15.1-1.pgdg110+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: autor2_replace_compilacion_with_semicolon(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.autor2_replace_compilacion_with_semicolon() RETURNS character varying
    LANGUAGE sql
    AS $_$
SELECT trim(REGEXP_REPLACE(autor2,'; COMP.$','')) FROM opac_autores_nomenclados WHERE autor2 LIKE '%; COMP.' ;
$_$;


--
-- Name: autor2_replace_editor_with_semicolon(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.autor2_replace_editor_with_semicolon() RETURNS character varying
    LANGUAGE sql
    AS $_$
SELECT trim(REGEXP_REPLACE(autor2,'; ED.$','')) FROM opac_autores_nomenclados WHERE autor2 LIKE '%; ED.' ;
$_$;


--
-- Name: autor2_replace_etal_point(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.autor2_replace_etal_point() RETURNS character varying
    LANGUAGE sql
    AS $_$
SELECT trim(REGEXP_REPLACE(autor2,'[ET AL]$','')) FROM opac_autores_nomenclados WHERE autor2 LIKE '%[ET AL]' ;
$_$;


--
-- Name: autor2_replace_prologo(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.autor2_replace_prologo() RETURNS character varying
    LANGUAGE sql
    AS $_$
SELECT trim(REGEXP_REPLACE(autor2,'PROL.$','')) FROM opac_autores_nomenclados WHERE autor2 LIKE '%PROL.' ;
$_$;


--
-- Name: autor2_replace_prologo_with_semicolon(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.autor2_replace_prologo_with_semicolon() RETURNS character varying
    LANGUAGE sql
    AS $_$
SELECT trim(REGEXP_REPLACE(autor2,'; PROL.$','')) FROM opac_autores_nomenclados WHERE autor2 LIKE '%; PROL.' ;
$_$;


--
-- Name: autor2_replace_traductor(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.autor2_replace_traductor() RETURNS character varying
    LANGUAGE sql
    AS $_$
SELECT trim(REGEXP_REPLACE(autor2,'TRAD.$','')) FROM opac_autores_nomenclados WHERE autor2 LIKE '%TRAD.' ;
$_$;


--
-- Name: autor2_replace_traductor_point(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.autor2_replace_traductor_point() RETURNS character varying
    LANGUAGE sql
    AS $_$
SELECT trim(REGEXP_REPLACE(autor2,'TRAD.$','')) FROM opac_autores_nomenclados WHERE autor2 LIKE '%TRAD.' ;
$_$;


--
-- Name: autor2_replace_traductor_semicolon_nopoint(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.autor2_replace_traductor_semicolon_nopoint() RETURNS character varying
    LANGUAGE sql
    AS $_$
SELECT trim(REGEXP_REPLACE(autor2,'; TRAD$','')) FROM opac_autores_nomenclados WHERE autor2 LIKE '%; TRAD' ;
$_$;


--
-- Name: autor2_replace_traductor_with_double_space(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.autor2_replace_traductor_with_double_space() RETURNS character varying
    LANGUAGE sql
    AS $_$SELECT trim(REGEXP_REPLACE(autor2,' TRAD.$','; TRAD.')) FROM opac_autores_nomenclados_2 WHERE autor2 LIKE '% TRAD.'$_$;


--
-- Name: FUNCTION autor2_replace_traductor_with_double_space(); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION public.autor2_replace_traductor_with_double_space() IS 'Eliminacion de trad precedido de doble espacio';


--
-- Name: autor2_replace_traductor_with_semicolon(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.autor2_replace_traductor_with_semicolon() RETURNS character varying
    LANGUAGE sql
    AS $_$
SELECT trim(REGEXP_REPLACE(autor2,'; TRAD.$','')) FROM opac_autores_nomenclados WHERE autor2 LIKE '%; TRAD.' ;
$_$;


--
-- Name: autor2_replace_traductor_without_point(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.autor2_replace_traductor_without_point() RETURNS character varying
    LANGUAGE sql
    AS $_$SELECT trim(REGEXP_REPLACE(autor2,' TRAD$',' TRAD.')) FROM opac_autores_nomenclados_2 WHERE autor2 LIKE '% TRAD' ;$_$;


--
-- Name: autor_replace_traductor_without_point(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.autor_replace_traductor_without_point() RETURNS character varying
    LANGUAGE sql
    AS $_$SELECT trim(REGEXP_REPLACE(autor,' TRAD$',' TRAD.')) FROM opac_autores_nomenclados_2 WHERE autor LIKE '% TRAD' ;$_$;


--
-- Name: FUNCTION autor_replace_traductor_without_point(); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION public.autor_replace_traductor_without_point() IS 'Funcion para restablecer el punto al final de los que no lo tienen en autor1 en la tabla opac_autores_nomenclados_2 y son traductores.';


--
-- Name: curso_academico(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.curso_academico() RETURNS timestamp with time zone
    LANGUAGE plpgsql
    AS $$DECLARE
    año_academico integer = extract(year from current_date) ;
    mes_extraido integer = extract(month from current_date) ;
    curso_academico date ;
    
BEGIN

 IF mes_extraido <= 7 THEN 
   curso_academico = make_timestamptz(año_academico -1 ,09,01,00,00,00.5,'EDT') ;
 END IF ;    
 
 IF mes_extraido > 9 THEN 
   curso_academico = make_timestamptz(año_academico , 09,01,00,00,00.5,'CDT')  ;
 END IF ;    
 
 RETURN curso_academico ; 
    
  
END ;$$;


--
-- Name: dummy_replace(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.dummy_replace() RETURNS character varying
    LANGUAGE sql
    AS $_$
SELECT trim(REGEXP_REPLACE(nombre_usuario,'klk$','')) FROM dummy_replace_text ;
$_$;


--
-- Name: seleccionar_coleccion_from_migration(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.seleccionar_coleccion_from_migration() RETURNS SETOF integer
    LANGUAGE sql
    AS $$   

SELECT opac_coleccion.id FROM opac_coleccion,opac_libro_migration  WHERE opac_libro_migration.coleccion = opac_coleccion.nombre_colección ;

$$;


--
-- Name: seleccionar_descriptor(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.seleccionar_descriptor() RETURNS SETOF character varying
    LANGUAGE sql
    AS $$   

SELECT descriptor FROM opac_libro_migration ;
$$;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: authtoken_token; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


--
-- Name: chat_chatsession; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.chat_chatsession (
    id integer NOT NULL,
    create_date timestamp with time zone NOT NULL,
    update_date timestamp with time zone NOT NULL,
    uri character varying(200) NOT NULL,
    owner_id integer NOT NULL
);


--
-- Name: chat_chatsession_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.chat_chatsession_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: chat_chatsession_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.chat_chatsession_id_seq OWNED BY public.chat_chatsession.id;


--
-- Name: chat_chatsessionmember; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.chat_chatsessionmember (
    id integer NOT NULL,
    create_date timestamp with time zone NOT NULL,
    update_date timestamp with time zone NOT NULL,
    chat_session_id integer NOT NULL,
    user_id integer NOT NULL
);


--
-- Name: chat_chatsessionmember_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.chat_chatsessionmember_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: chat_chatsessionmember_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.chat_chatsessionmember_id_seq OWNED BY public.chat_chatsessionmember.id;


--
-- Name: chat_chatsessionmessage; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.chat_chatsessionmessage (
    id integer NOT NULL,
    create_date timestamp with time zone NOT NULL,
    update_date timestamp with time zone NOT NULL,
    message text NOT NULL,
    chat_session_id integer NOT NULL,
    user_id integer NOT NULL
);


--
-- Name: chat_chatsessionmessage_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.chat_chatsessionmessage_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: chat_chatsessionmessage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.chat_chatsessionmessage_id_seq OWNED BY public.chat_chatsessionmessage.id;


--
-- Name: opac_ciudades; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.opac_ciudades (
    id integer NOT NULL,
    nombre_ciudad character varying(50),
    nombre_pais character varying(50),
    nombre_pais_id integer NOT NULL
);


--
-- Name: ciudades_pais_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ciudades_pais_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ciudades_pais_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.ciudades_pais_id_seq OWNED BY public.opac_ciudades.id;


--
-- Name: contab_adq_vendedor; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.contab_adq_vendedor (
    id integer NOT NULL,
    nombre_vendedor character varying(50) NOT NULL,
    direccion_1 text NOT NULL,
    direccion_2 character varying(100),
    direccion_3 character varying(100),
    direccion_4 character varying(100),
    telefono character varying(11),
    otro_proveedor character varying(50),
    email character varying(254),
    fax character varying(11),
    observaciones text,
    descuento numeric(2,1) NOT NULL,
    es_institucion boolean NOT NULL
);


--
-- Name: contab_adq_vendedor_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.contab_adq_vendedor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: contab_adq_vendedor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.contab_adq_vendedor_id_seq OWNED BY public.contab_adq_vendedor.id;


--
-- Name: contab_adquisicion; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.contab_adquisicion (
    id integer NOT NULL,
    precio numeric(5,2) NOT NULL,
    tipo_moneda character varying(3) NOT NULL,
    tipo_adquisicion character varying(3) NOT NULL,
    fecha_adquisicion timestamp with time zone NOT NULL,
    nombre_vendedor_id integer NOT NULL
);


--
-- Name: contab_adquisicion_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.contab_adquisicion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: contab_adquisicion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.contab_adquisicion_id_seq OWNED BY public.contab_adquisicion.id;


--
-- Name: contab_contrato; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.contab_contrato (
    numero_contrato character varying(10) NOT NULL,
    fecha_inicio date NOT NULL,
    nombre character varying(50) NOT NULL,
    descripcion text NOT NULL
);


--
-- Name: contab_presupuesto; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.contab_presupuesto (
    id integer NOT NULL,
    codigo character varying(4) NOT NULL,
    nombre character varying(40) NOT NULL,
    cantidad_aprob numeric(6,2) NOT NULL,
    responsable character varying(40) NOT NULL,
    periodo_id integer NOT NULL
);


--
-- Name: contab_presupuesto_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.contab_presupuesto_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: contab_presupuesto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.contab_presupuesto_id_seq OWNED BY public.contab_presupuesto.id;


--
-- Name: contab_presupuesto_periodo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.contab_presupuesto_periodo (
    id_periodo integer NOT NULL,
    fecha_inicio date NOT NULL,
    fecha_culminacion date NOT NULL,
    periodo date NOT NULL
);


--
-- Name: contab_ventas; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.contab_ventas (
    id integer NOT NULL,
    nombre_ejemplar character varying(100) NOT NULL,
    precio_venta numeric(4,2) NOT NULL,
    fecha_venta date NOT NULL,
    observaciones text
);


--
-- Name: contab_ventas_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.contab_ventas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: contab_ventas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.contab_ventas_id_seq OWNED BY public.contab_ventas.id;


--
-- Name: descriptores_agrupados; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.descriptores_agrupados (
    id integer,
    descriptores text
);


--
-- Name: descriptores_agrupados_final; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.descriptores_agrupados_final (
    id integer,
    descriptores character varying
);


--
-- Name: descriptores_agrupados_final_2; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.descriptores_agrupados_final_2 (
    "array" integer[]
);


--
-- Name: descriptores_agrupados_ultimo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.descriptores_agrupados_ultimo (
    unnest integer
);


--
-- Name: descriptores_agrupados_ultimo_2; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.descriptores_agrupados_ultimo_2 (
    id integer,
    unnest integer
);


--
-- Name: descriptores_agrupados_ultimo_test; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.descriptores_agrupados_ultimo_test (
    opaclibro_id integer,
    opacdescriptor_id integer
);


--
-- Name: descriptores_aislados; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.descriptores_aislados (
    descriptor4 text,
    descriptor1 text,
    descriptor2 text,
    descriptor3 text,
    id integer NOT NULL
);


--
-- Name: descriptores_aislados_integer; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.descriptores_aislados_integer (
    descriptor4 integer,
    descriptor1 integer,
    descriptor2 integer,
    descriptor3 integer,
    id integer
);


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


--
-- Name: dummy_replace; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dummy_replace (
);


--
-- Name: dummy_replace_text; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dummy_replace_text (
    id integer NOT NULL,
    nombre_usuario character varying(50),
    nombre character varying(30),
    apellidos character varying(170)
);


--
-- Name: dummy_replace_text_2; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dummy_replace_text_2 (
);


--
-- Name: dummy_replace_text_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dummy_replace_text_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dummy_replace_text_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dummy_replace_text_id_seq OWNED BY public.dummy_replace_text.id;


--
-- Name: knox_authtoken; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.knox_authtoken (
    digest character varying(128) NOT NULL,
    salt character varying(16) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id integer NOT NULL,
    expiry timestamp with time zone,
    token_key character varying(8) NOT NULL
);


--
-- Name: nov_bibliograficas_boletin; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.nov_bibliograficas_boletin (
    id integer NOT NULL,
    nov_boletin_titulo character varying(100) NOT NULL,
    nov_boletin_autor character varying(30) NOT NULL,
    nov_boletin_fecha timestamp with time zone NOT NULL,
    nov_boletin_categoria character varying(30) NOT NULL,
    imagen_de_cubierta character varying(100) NOT NULL,
    nov_boletin_text text NOT NULL,
    documento_de_boletin character varying(100) NOT NULL
);


--
-- Name: nov_bibliograficas_boletin_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.nov_bibliograficas_boletin_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: nov_bibliograficas_boletin_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.nov_bibliograficas_boletin_id_seq OWNED BY public.nov_bibliograficas_boletin.id;


--
-- Name: opac_autor; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.opac_autor (
    id integer NOT NULL,
    nombre_autor character varying(150) NOT NULL
);


--
-- Name: opac_autor_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.opac_autor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: opac_autor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.opac_autor_id_seq OWNED BY public.opac_autor.id;


--
-- Name: opac_autor_migration; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.opac_autor_migration (
    autor character varying(40),
    id integer NOT NULL
);


--
-- Name: opac_autor_migration_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.opac_autor_migration_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: opac_autor_migration_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.opac_autor_migration_id_seq OWNED BY public.opac_autor_migration.id;


--
-- Name: opac_autores_nomenclados; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.opac_autores_nomenclados (
    no_reg integer,
    autor character varying(40),
    autor2 character varying(40)
);


--
-- Name: opac_autores_nomenclados_2; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.opac_autores_nomenclados_2 (
    no_reg integer,
    autor character varying(40),
    autor2 character varying(40),
    autor_pesp_id integer,
    autor2_pesp_id integer
);


--
-- Name: opac_catedra; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.opac_catedra (
    id integer NOT NULL,
    nombre_catedra character varying(60) NOT NULL,
    localizacion text
);


--
-- Name: opac_catedra_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.opac_catedra_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: opac_catedra_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.opac_catedra_id_seq OWNED BY public.opac_catedra.id;


--
-- Name: opac_ciudad; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.opac_ciudad (
    id integer,
    nombre_ciudad character varying(50),
    nombre_pais character varying(50),
    nombre_pais_id integer
);


--
-- Name: opac_ciudades_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.opac_ciudades_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: opac_coleccion; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.opac_coleccion (
    id integer NOT NULL,
    nombre_coleccion character varying(30)
);


--
-- Name: opac_coleccion_2; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.opac_coleccion_2 (
    id integer NOT NULL,
    "nombre_colección" character varying(30)
);


--
-- Name: opac_coleccion_2_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.opac_coleccion_2_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: opac_coleccion_2_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.opac_coleccion_2_id_seq OWNED BY public.opac_coleccion_2.id;


--
-- Name: opac_colección; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."opac_colección" (
    id integer NOT NULL,
    "nombre_colección" character varying(100)
);


--
-- Name: opac_coleccion_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.opac_coleccion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: opac_coleccion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.opac_coleccion_id_seq OWNED BY public."opac_colección".id;


--
-- Name: opac_coleccion_id_seq1; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.opac_coleccion_id_seq1
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: opac_coleccion_id_seq1; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.opac_coleccion_id_seq1 OWNED BY public.opac_coleccion.id;


--
-- Name: opac_descriptor; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.opac_descriptor (
    id integer NOT NULL,
    nombre_descriptor character varying(100),
    nombre_antigup_descriptor character varying(100)
);


--
-- Name: opac_descriptores_migration; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.opac_descriptores_migration (
    id integer NOT NULL,
    nombre_descriptor character varying(100) NOT NULL,
    nombre_antiguo_descriptor character varying(100) NOT NULL
);


--
-- Name: opac_descriptor_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.opac_descriptor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: opac_descriptor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.opac_descriptor_id_seq OWNED BY public.opac_descriptores_migration.id;


--
-- Name: opac_descriptor_id_seq1; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.opac_descriptor_id_seq1
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: opac_descriptor_id_seq1; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.opac_descriptor_id_seq1 OWNED BY public.opac_descriptor.id;


--
-- Name: opac_descriptores_aislados_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.opac_descriptores_aislados_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: opac_descriptores_migration_1_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.opac_descriptores_migration_1_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: opac_descriptores_migration_1; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.opac_descriptores_migration_1 (
    id integer DEFAULT nextval('public.opac_descriptores_migration_1_id_seq'::regclass) NOT NULL,
    nombre_descriptor character varying(100),
    nombre_antiguo_descriptor character varying(100)
);


--
-- Name: opac_docs_dig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.opac_docs_dig (
    signatura character varying(36) NOT NULL,
    "título" character varying(50) NOT NULL,
    ano character varying(10),
    tipo_documento_digital_id integer NOT NULL,
    resumen text,
    autor_id integer NOT NULL,
    autor2_id integer,
    editorial_id integer NOT NULL,
    descriptor_id integer NOT NULL,
    autor3_id integer,
    "Localización" character varying(256) NOT NULL
);


--
-- Name: opac_editorial; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.opac_editorial (
    id integer NOT NULL,
    nombre_editorial character varying(100) NOT NULL,
    pais_origen_id integer
);


--
-- Name: opac_editorial_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.opac_editorial_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: opac_editorial_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.opac_editorial_id_seq OWNED BY public.opac_editorial.id;


--
-- Name: opac_idioma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.opac_idioma (
    id integer NOT NULL,
    idioma character varying(40) NOT NULL
);


--
-- Name: opac_idioma_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.opac_idioma_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: opac_idioma_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.opac_idioma_id_seq OWNED BY public.opac_idioma.id;


--
-- Name: opac_institucion; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.opac_institucion (
    id integer NOT NULL,
    "nombre_institución" character varying(70) NOT NULL,
    es_externa boolean NOT NULL,
    "direccion_institución" text,
    telf_inst1 character varying(13),
    telf_inst2 character varying(13),
    fax_inst character varying(13),
    email_inst character varying(50)
);


--
-- Name: opac_institucion_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.opac_institucion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: opac_institucion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.opac_institucion_id_seq OWNED BY public.opac_institucion.id;


--
-- Name: opac_libro_legacy; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.opac_libro_legacy (
    no_reg integer NOT NULL,
    signatura character varying(50) NOT NULL,
    fecha_registro timestamp with time zone,
    "título" character varying(120) NOT NULL,
    "edición" character varying(10),
    "año_impr" character varying(4) NOT NULL,
    idioma_id integer,
    "localización" character varying(120) NOT NULL,
    resumen text,
    baja boolean,
    solo_consulta boolean,
    "en_reparación" boolean,
    isbn character varying(20),
    tipo_soporte_id integer,
    editorial_id integer NOT NULL,
    "colección_id" integer,
    autor character varying(40),
    autor2 character varying(40),
    autor2_id integer,
    autor_id integer,
    ciudad character varying(100),
    autor3_id integer,
    "lugar_de_impresión_id" integer NOT NULL
);


--
-- Name: opac_libro_legacy_descriptores; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.opac_libro_legacy_descriptores (
    id integer NOT NULL,
    opaclibro_id integer NOT NULL,
    opacdescriptor_id integer NOT NULL
);


--
-- Name: opac_libro_legacy_descriptores_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.opac_libro_legacy_descriptores_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: opac_libro_legacy_descriptores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.opac_libro_legacy_descriptores_id_seq OWNED BY public.opac_libro_legacy_descriptores.id;


--
-- Name: opac_libro_mgration_2; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.opac_libro_mgration_2 (
    no_reg integer,
    signatura character varying(20),
    fecha_registro timestamp without time zone,
    titulo character varying(120),
    autor character varying(40),
    autor2 character varying(40),
    omr character varying(40),
    editorial character varying(40),
    isbn character varying(20),
    coleccion character varying(30),
    edicion character varying(2),
    lugar_impr character varying(20),
    ano_impr character varying(4),
    descriptor character varying(60),
    idioma character varying(15),
    soporte character varying(15),
    localizacion character varying(120),
    prestado boolean,
    solo_consulta boolean,
    baja boolean,
    lista_espera boolean,
    resumen text,
    notas2 text,
    descriptor1 character varying(60),
    descriptor2 character varying(60),
    descriptor3 character varying(60),
    descriptor4 character varying(60)
);


--
-- Name: opac_libro_migration; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.opac_libro_migration (
    no_reg integer NOT NULL,
    signatura character varying(20),
    fecha_registro timestamp without time zone,
    titulo character varying(120),
    autor character varying(40),
    autor2 character varying(40),
    omr character varying(40),
    editorial character varying(40),
    isbn character varying(20),
    coleccion character varying(30),
    edicion character varying(2),
    lugar_impr character varying(20),
    ano_impr character varying(4),
    descriptor character varying(60),
    idioma character varying(15),
    soporte character varying(15),
    localizacion character varying(120),
    prestado boolean,
    solo_consulta boolean,
    baja boolean,
    lista_espera boolean,
    resumen text,
    notas2 text,
    descriptor1 character varying(60),
    descriptor2 character varying(60),
    descriptor3 character varying(60),
    descriptor4 character varying(60)
);


--
-- Name: opac_libro_migration_2; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.opac_libro_migration_2 (
    no_reg integer,
    signatura character varying(20),
    fecha_registro timestamp without time zone,
    titulo character varying(120),
    autor character varying(40),
    autor2 character varying(40),
    omr character varying(40),
    editorial character varying(40),
    isbn character varying(20),
    coleccion character varying(30),
    edicion character varying(2),
    lugar_impr character varying(20),
    ano_impr character varying(4),
    descriptor character varying(60),
    idioma character varying(15),
    soporte character varying(15),
    localizacion character varying(120),
    prestado boolean,
    solo_consulta boolean,
    baja boolean,
    lista_espera boolean,
    resumen text,
    notas2 text,
    descriptor1 character varying(60),
    descriptor2 character varying(60),
    descriptor3 character varying(60),
    descriptor4 character varying(60),
    autor_participacion_autoral integer,
    autor2_participacion_autoral integer
);


--
-- Name: opac_libro_participacion_especial; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.opac_libro_participacion_especial (
    id integer NOT NULL,
    nombre_participacion character varying(25),
    descripcion_participacion text
);


--
-- Name: opac_libro_participacion_especial_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.opac_libro_participacion_especial_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: opac_libro_participacion_especial_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.opac_libro_participacion_especial_id_seq OWNED BY public.opac_libro_participacion_especial.id;


--
-- Name: opac_libros_hosting; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.opac_libros_hosting (
    titulo character varying(120),
    autor character varying(40),
    autor2 character varying(40),
    resumen text,
    signatura_topografica character varying(50),
    isbn character varying(20),
    propietario_recurso integer,
    tipo_recurso integer,
    autor3 character varying
);


--
-- Name: opac_marc; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.opac_marc (
    id integer NOT NULL,
    "NR" integer,
    "Etiqueta" character varying(3),
    "Tamaño" character varying(4),
    "Posición" character varying(5),
    "Indicador" character varying(2),
    "Subcampo" character varying(2),
    "Contido" character varying(250)
);


--
-- Name: opac_marc2; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.opac_marc2 (
    id integer NOT NULL,
    num_rex integer NOT NULL,
    sinatura character varying(20),
    data_rex timestamp with time zone,
    "título" character varying(120),
    autor character varying(40),
    autor2 character varying(40),
    omr character varying(40),
    editorial character varying(40),
    "ISBN" character varying(20),
    "colección" character varying(30),
    edicion character varying(2),
    lugar_impr character varying(20),
    ano_impr character varying(4),
    temas character varying(60),
    idioma character varying(15),
    soporte character varying(15),
    prestado boolean,
    no_prestar boolean,
    baja boolean,
    listaespera boolean,
    notas text
);


--
-- Name: opac_marc2_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.opac_marc2_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: opac_marc2_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.opac_marc2_id_seq OWNED BY public.opac_marc2.id;


--
-- Name: opac_marc_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.opac_marc_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: opac_marc_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.opac_marc_id_seq OWNED BY public.opac_marc.id;


--
-- Name: opac_materias; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.opac_materias (
    id integer NOT NULL,
    nombre_materia character varying(40) NOT NULL,
    descripcion_materia text NOT NULL
);


--
-- Name: opac_materias_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.opac_materias_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: opac_materias_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.opac_materias_id_seq OWNED BY public.opac_materias.id;


--
-- Name: opac_pais; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.opac_pais (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    codigo_iso character varying(2) NOT NULL
);


--
-- Name: opac_pais_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.opac_pais_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: opac_pais_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.opac_pais_id_seq OWNED BY public.opac_pais.id;


--
-- Name: opac_prestamos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.opac_prestamos (
    carnet character varying(8),
    apellidos character varying(25) NOT NULL,
    nombre character varying(25) NOT NULL,
    observaciones character varying(60),
    cliente character varying(1),
    curso character varying(6),
    fecha_inicio timestamp with time zone,
    fecha_fin timestamp with time zone,
    devuelto boolean,
    tipo_servicio_solicitado character varying(120),
    busqueda_digital boolean NOT NULL,
    busqueda_referencia boolean NOT NULL,
    cantidad_de_paginas_reprografia integer,
    compilacion_de_informacion boolean NOT NULL,
    lectura_en_sala boolean NOT NULL,
    prestamo_externo boolean NOT NULL,
    reprografia boolean NOT NULL,
    signatura_lectura_en_sala character varying(15),
    signatura_prestamo_externo character varying(15),
    termino_busqueda_compilacion_informacion text,
    termino_busqueda_digital text,
    terminos_busqueda_referencia text,
    no integer NOT NULL
);


--
-- Name: opac_prestamos_no_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.opac_prestamos_no_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: opac_prestamos_no_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.opac_prestamos_no_seq OWNED BY public.opac_prestamos.no;


--
-- Name: opac_revs_articulo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.opac_revs_articulo (
    id integer NOT NULL,
    signatura character varying(36) NOT NULL,
    "Titulo" character varying(350) NOT NULL,
    resumen text NOT NULL,
    pag_pag character varying(8) NOT NULL,
    autor_id integer NOT NULL,
    autor2_id integer,
    nombre_revista_id integer NOT NULL,
    autor3_id integer,
    autor4_id integer
);


--
-- Name: opac_revs_articulo_descriptores; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.opac_revs_articulo_descriptores (
    id integer NOT NULL,
    opacrevsarticulo_id integer NOT NULL,
    opacdescriptor_id integer NOT NULL
);


--
-- Name: opac_revs_articulo_descriptores_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.opac_revs_articulo_descriptores_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: opac_revs_articulo_descriptores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.opac_revs_articulo_descriptores_id_seq OWNED BY public.opac_revs_articulo_descriptores.id;


--
-- Name: opac_revs_articulo_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.opac_revs_articulo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: opac_revs_articulo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.opac_revs_articulo_id_seq OWNED BY public.opac_revs_articulo.id;


--
-- Name: opac_revs_ejemplar; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.opac_revs_ejemplar (
    signatura character varying(20) NOT NULL,
    nombre_revista character varying(100) NOT NULL,
    volumen character varying(3),
    "ISSN" character varying(20),
    "No" character varying(3),
    mes date NOT NULL,
    "Fecha" character varying(30) NOT NULL,
    ano character varying(10),
    editorial_id integer NOT NULL,
    nombre_materia_id integer NOT NULL,
    no_reg integer NOT NULL,
    localizacion character varying(40) NOT NULL,
    "institución_id" integer NOT NULL
);


--
-- Name: opac_revs_ejemplar_no_reg_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.opac_revs_ejemplar_no_reg_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: opac_revs_ejemplar_no_reg_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.opac_revs_ejemplar_no_reg_seq OWNED BY public.opac_revs_ejemplar.no_reg;


--
-- Name: opac_soporte; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.opac_soporte (
    id integer NOT NULL,
    tipo_soporte character varying(40) NOT NULL
);


--
-- Name: opac_soporte_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.opac_soporte_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: opac_soporte_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.opac_soporte_id_seq OWNED BY public.opac_soporte.id;


--
-- Name: opac_temp_prestados; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.opac_temp_prestados (
    id integer NOT NULL,
    curso character varying(6),
    ncb character varying(8),
    nombrecompleto character varying(50),
    num_rex character varying(10),
    fecha_devolucion character varying(10),
    sinatura character varying(20),
    soporte character varying(15),
    titulo character varying(120)
);


--
-- Name: opac_temp_prestados_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.opac_temp_prestados_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: opac_temp_prestados_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.opac_temp_prestados_id_seq OWNED BY public.opac_temp_prestados.id;


--
-- Name: opac_tesis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.opac_tesis (
    no_reg integer NOT NULL,
    signatura character varying(50) NOT NULL,
    "título" character varying(100) NOT NULL,
    tipo_documento character varying(10) NOT NULL,
    resumen text NOT NULL,
    tutor_1 character varying(100) NOT NULL,
    tutor_2 character varying(100),
    fecha date NOT NULL,
    ano character varying(10),
    grado_aspirante character varying(20) NOT NULL,
    palabras_clave character varying(200) NOT NULL,
    "localización" character varying(40) NOT NULL,
    autor_id integer NOT NULL,
    autor2_id integer,
    "cátedra_id" integer,
    disciplina_id integer NOT NULL,
    "institución_id" integer
);


--
-- Name: opac_tesis_autor; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.opac_tesis_autor (
    id integer NOT NULL,
    nombre_autor character varying(150) NOT NULL
);


--
-- Name: opac_tesis_autor_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.opac_tesis_autor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: opac_tesis_autor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.opac_tesis_autor_id_seq OWNED BY public.opac_tesis_autor.id;


--
-- Name: opac_tesis_descriptores; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.opac_tesis_descriptores (
    id integer NOT NULL,
    opactesis_id character varying(50) NOT NULL,
    opacdescriptor_id integer NOT NULL
);


--
-- Name: opac_tesis_descriptores_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.opac_tesis_descriptores_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: opac_tesis_descriptores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.opac_tesis_descriptores_id_seq OWNED BY public.opac_tesis_descriptores.id;


--
-- Name: opac_tipo_doc_dig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.opac_tipo_doc_dig (
    id integer NOT NULL,
    tipo_documento_digital character varying(20) NOT NULL
);


--
-- Name: opac_tipo_doc_dig_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.opac_tipo_doc_dig_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: opac_tipo_doc_dig_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.opac_tipo_doc_dig_id_seq OWNED BY public.opac_tipo_doc_dig.id;


--
-- Name: opac_usuario; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.opac_usuario (
    carnet character varying(8) NOT NULL,
    apellidos character varying(25),
    nombre character varying(25),
    cliente character varying(1),
    curso character varying(6),
    observaciones character varying(60),
    fecha_ultimo_prestamo timestamp with time zone,
    es_externo boolean
);


--
-- Name: rec_digs_asignatura; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.rec_digs_asignatura (
    id integer NOT NULL,
    asignatura character varying(30) NOT NULL
);


--
-- Name: rec_digs_asignatura_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.rec_digs_asignatura_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: rec_digs_asignatura_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.rec_digs_asignatura_id_seq OWNED BY public.rec_digs_asignatura.id;


--
-- Name: rec_digs_recursos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.rec_digs_recursos (
    no_reg integer NOT NULL,
    titulo_recurso character varying(50) NOT NULL,
    tipo_recurso_id integer NOT NULL,
    institucion_id integer NOT NULL,
    observaciones text
);


--
-- Name: rec_digs_tipo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.rec_digs_tipo (
    id integer NOT NULL,
    nombre_tipo_recurso character varying(50) NOT NULL
);


--
-- Name: recep_rec_digitales_tiporecurso_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.recep_rec_digitales_tiporecurso_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: recep_rec_digitales_tiporecurso_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.recep_rec_digitales_tiporecurso_id_seq OWNED BY public.rec_digs_tipo.id;


--
-- Name: reg_usuarios; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.reg_usuarios (
    "No" integer NOT NULL,
    fecha date NOT NULL,
    hora time without time zone NOT NULL,
    posee_carnet boolean,
    ncb character varying(11),
    tipo_usuario character varying(15) NOT NULL,
    prestamo_externo boolean NOT NULL,
    institucion_id integer NOT NULL,
    recurso_prestamo_id integer,
    nombre character varying(25) NOT NULL,
    apellidos character varying(25) NOT NULL,
    signatura_prestamo_externo character varying(15),
    lectura_en_sala boolean NOT NULL,
    reprografia boolean NOT NULL,
    signatura_lectura_en_sala character varying(15),
    cantidad_de_paginas_reprografia integer,
    busqueda_referencia boolean NOT NULL,
    terminos_busqueda_referencia text,
    busqueda_digital boolean NOT NULL,
    termino_busqueda_digital text,
    compilacion_de_informacion boolean NOT NULL,
    termino_busqueda_compilacion_informacion text
);


--
-- Name: reg_usuarios_No_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."reg_usuarios_No_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: reg_usuarios_No_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."reg_usuarios_No_seq" OWNED BY public.reg_usuarios."No";


--
-- Name: reporte_diario_biblioteca; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.reporte_diario_biblioteca AS
 SELECT django_admin_log.id,
    django_admin_log.action_time,
    auth_user.username,
    django_admin_log.change_message,
    django_admin_log.object_repr
   FROM (public.django_admin_log
     JOIN public.auth_user ON ((django_admin_log.user_id = auth_user.id)))
  WHERE ((django_admin_log.content_type_id > 7) AND (django_admin_log.content_type_id < 28))
  ORDER BY django_admin_log.action_time;


--
-- Name: reportes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.reportes (
    id integer NOT NULL
);


--
-- Name: reportes_reportes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.reportes_reportes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: reportes_reportes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.reportes_reportes_id_seq OWNED BY public.reportes.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version bigint NOT NULL,
    inserted_at timestamp(0) without time zone
);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: chat_chatsession id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.chat_chatsession ALTER COLUMN id SET DEFAULT nextval('public.chat_chatsession_id_seq'::regclass);


--
-- Name: chat_chatsessionmember id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.chat_chatsessionmember ALTER COLUMN id SET DEFAULT nextval('public.chat_chatsessionmember_id_seq'::regclass);


--
-- Name: chat_chatsessionmessage id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.chat_chatsessionmessage ALTER COLUMN id SET DEFAULT nextval('public.chat_chatsessionmessage_id_seq'::regclass);


--
-- Name: contab_adq_vendedor id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contab_adq_vendedor ALTER COLUMN id SET DEFAULT nextval('public.contab_adq_vendedor_id_seq'::regclass);


--
-- Name: contab_adquisicion id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contab_adquisicion ALTER COLUMN id SET DEFAULT nextval('public.contab_adquisicion_id_seq'::regclass);


--
-- Name: contab_presupuesto id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contab_presupuesto ALTER COLUMN id SET DEFAULT nextval('public.contab_presupuesto_id_seq'::regclass);


--
-- Name: contab_ventas id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contab_ventas ALTER COLUMN id SET DEFAULT nextval('public.contab_ventas_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: dummy_replace_text id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dummy_replace_text ALTER COLUMN id SET DEFAULT nextval('public.dummy_replace_text_id_seq'::regclass);


--
-- Name: nov_bibliograficas_boletin id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nov_bibliograficas_boletin ALTER COLUMN id SET DEFAULT nextval('public.nov_bibliograficas_boletin_id_seq'::regclass);


--
-- Name: opac_autor id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.opac_autor ALTER COLUMN id SET DEFAULT nextval('public.opac_autor_id_seq'::regclass);


--
-- Name: opac_autor_migration id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.opac_autor_migration ALTER COLUMN id SET DEFAULT nextval('public.opac_autor_migration_id_seq'::regclass);


--
-- Name: opac_catedra id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.opac_catedra ALTER COLUMN id SET DEFAULT nextval('public.opac_catedra_id_seq'::regclass);


--
-- Name: opac_ciudades id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.opac_ciudades ALTER COLUMN id SET DEFAULT nextval('public.ciudades_pais_id_seq'::regclass);


--
-- Name: opac_coleccion id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.opac_coleccion ALTER COLUMN id SET DEFAULT nextval('public.opac_coleccion_id_seq1'::regclass);


--
-- Name: opac_coleccion_2 id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.opac_coleccion_2 ALTER COLUMN id SET DEFAULT nextval('public.opac_coleccion_2_id_seq'::regclass);


--
-- Name: opac_colección id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."opac_colección" ALTER COLUMN id SET DEFAULT nextval('public.opac_coleccion_id_seq'::regclass);


--
-- Name: opac_descriptor id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.opac_descriptor ALTER COLUMN id SET DEFAULT nextval('public.opac_descriptor_id_seq1'::regclass);


--
-- Name: opac_descriptores_migration id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.opac_descriptores_migration ALTER COLUMN id SET DEFAULT nextval('public.opac_descriptor_id_seq'::regclass);


--
-- Name: opac_editorial id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.opac_editorial ALTER COLUMN id SET DEFAULT nextval('public.opac_editorial_id_seq'::regclass);


--
-- Name: opac_idioma id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.opac_idioma ALTER COLUMN id SET DEFAULT nextval('public.opac_idioma_id_seq'::regclass);


--
-- Name: opac_institucion id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.opac_institucion ALTER COLUMN id SET DEFAULT nextval('public.opac_institucion_id_seq'::regclass);


--
-- Name: opac_libro_legacy_descriptores id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.opac_libro_legacy_descriptores ALTER COLUMN id SET DEFAULT nextval('public.opac_libro_legacy_descriptores_id_seq'::regclass);


--
-- Name: opac_libro_participacion_especial id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.opac_libro_participacion_especial ALTER COLUMN id SET DEFAULT nextval('public.opac_libro_participacion_especial_id_seq'::regclass);


--
-- Name: opac_marc id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.opac_marc ALTER COLUMN id SET DEFAULT nextval('public.opac_marc_id_seq'::regclass);


--
-- Name: opac_marc2 id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.opac_marc2 ALTER COLUMN id SET DEFAULT nextval('public.opac_marc2_id_seq'::regclass);


--
-- Name: opac_materias id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.opac_materias ALTER COLUMN id SET DEFAULT nextval('public.opac_materias_id_seq'::regclass);


--
-- Name: opac_pais id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.opac_pais ALTER COLUMN id SET DEFAULT nextval('public.opac_pais_id_seq'::regclass);


--
-- Name: opac_prestamos no; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.opac_prestamos ALTER COLUMN no SET DEFAULT nextval('public.opac_prestamos_no_seq'::regclass);


--
-- Name: opac_revs_articulo id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.opac_revs_articulo ALTER COLUMN id SET DEFAULT nextval('public.opac_revs_articulo_id_seq'::regclass);


--
-- Name: opac_revs_articulo_descriptores id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.opac_revs_articulo_descriptores ALTER COLUMN id SET DEFAULT nextval('public.opac_revs_articulo_descriptores_id_seq'::regclass);


--
-- Name: opac_revs_ejemplar no_reg; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.opac_revs_ejemplar ALTER COLUMN no_reg SET DEFAULT nextval('public.opac_revs_ejemplar_no_reg_seq'::regclass);


--
-- Name: opac_soporte id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.opac_soporte ALTER COLUMN id SET DEFAULT nextval('public.opac_soporte_id_seq'::regclass);


--
-- Name: opac_temp_prestados id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.opac_temp_prestados ALTER COLUMN id SET DEFAULT nextval('public.opac_temp_prestados_id_seq'::regclass);


--
-- Name: opac_tesis_autor id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.opac_tesis_autor ALTER COLUMN id SET DEFAULT nextval('public.opac_tesis_autor_id_seq'::regclass);


--
-- Name: opac_tesis_descriptores id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.opac_tesis_descriptores ALTER COLUMN id SET DEFAULT nextval('public.opac_tesis_descriptores_id_seq'::regclass);


--
-- Name: opac_tipo_doc_dig id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.opac_tipo_doc_dig ALTER COLUMN id SET DEFAULT nextval('public.opac_tipo_doc_dig_id_seq'::regclass);


--
-- Name: rec_digs_asignatura id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rec_digs_asignatura ALTER COLUMN id SET DEFAULT nextval('public.rec_digs_asignatura_id_seq'::regclass);


--
-- Name: rec_digs_tipo id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rec_digs_tipo ALTER COLUMN id SET DEFAULT nextval('public.recep_rec_digitales_tiporecurso_id_seq'::regclass);


--
-- Name: reg_usuarios No; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reg_usuarios ALTER COLUMN "No" SET DEFAULT nextval('public."reg_usuarios_No_seq"'::regclass);


--
-- Name: reportes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reportes ALTER COLUMN id SET DEFAULT nextval('public.reportes_reportes_id_seq'::regclass);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: authtoken_token authtoken_token_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);


--
-- Name: authtoken_token authtoken_token_user_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);


--
-- Name: chat_chatsession chat_chatsession_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.chat_chatsession
    ADD CONSTRAINT chat_chatsession_pkey PRIMARY KEY (id);


--
-- Name: chat_chatsessionmember chat_chatsessionmember_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.chat_chatsessionmember
    ADD CONSTRAINT chat_chatsessionmember_pkey PRIMARY KEY (id);


--
-- Name: chat_chatsessionmessage chat_chatsessionmessage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.chat_chatsessionmessage
    ADD CONSTRAINT chat_chatsessionmessage_pkey PRIMARY KEY (id);


--
-- Name: contab_adq_vendedor contab_adq_vendedor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contab_adq_vendedor
    ADD CONSTRAINT contab_adq_vendedor_pkey PRIMARY KEY (id);


--
-- Name: contab_adquisicion contab_adquisicion_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contab_adquisicion
    ADD CONSTRAINT contab_adquisicion_pkey PRIMARY KEY (id);


--
-- Name: contab_contrato contab_contrato_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contab_contrato
    ADD CONSTRAINT contab_contrato_pkey PRIMARY KEY (numero_contrato);


--
-- Name: contab_presupuesto_periodo contab_presupuesto_periodo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contab_presupuesto_periodo
    ADD CONSTRAINT contab_presupuesto_periodo_pkey PRIMARY KEY (id_periodo);


--
-- Name: contab_presupuesto contab_presupuesto_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contab_presupuesto
    ADD CONSTRAINT contab_presupuesto_pkey PRIMARY KEY (id);


--
-- Name: contab_ventas contab_ventas_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contab_ventas
    ADD CONSTRAINT contab_ventas_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: dummy_replace_text dummy_replace_text_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dummy_replace_text
    ADD CONSTRAINT dummy_replace_text_pkey PRIMARY KEY (id);


--
-- Name: knox_authtoken knox_authtoken_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.knox_authtoken
    ADD CONSTRAINT knox_authtoken_pkey PRIMARY KEY (digest);


--
-- Name: knox_authtoken knox_authtoken_salt_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.knox_authtoken
    ADD CONSTRAINT knox_authtoken_salt_key UNIQUE (salt);


--
-- Name: nov_bibliograficas_boletin nov_bibliograficas_boletin_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nov_bibliograficas_boletin
    ADD CONSTRAINT nov_bibliograficas_boletin_pkey PRIMARY KEY (id);


--
-- Name: opac_autor opac_autor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.opac_autor
    ADD CONSTRAINT opac_autor_pkey PRIMARY KEY (id);


--
-- Name: opac_catedra opac_catedra_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.opac_catedra
    ADD CONSTRAINT opac_catedra_pkey PRIMARY KEY (id);


--
-- Name: opac_ciudades opac_ciudades_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.opac_ciudades
    ADD CONSTRAINT opac_ciudades_pkey PRIMARY KEY (id);


--
-- Name: opac_colección opac_coleccion_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."opac_colección"
    ADD CONSTRAINT opac_coleccion_pkey PRIMARY KEY (id);


--
-- Name: opac_coleccion opac_coleccion_pkey1; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.opac_coleccion
    ADD CONSTRAINT opac_coleccion_pkey1 PRIMARY KEY (id);


--
-- Name: opac_descriptores_migration opac_descriptor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.opac_descriptores_migration
    ADD CONSTRAINT opac_descriptor_pkey PRIMARY KEY (id);


--
-- Name: opac_descriptor opac_descriptor_pkey1; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.opac_descriptor
    ADD CONSTRAINT opac_descriptor_pkey1 PRIMARY KEY (id);


--
-- Name: opac_descriptores_migration_1 opac_descriptores_migration_1_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.opac_descriptores_migration_1
    ADD CONSTRAINT opac_descriptores_migration_1_pkey PRIMARY KEY (id);


--
-- Name: opac_docs_dig opac_docs_dig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.opac_docs_dig
    ADD CONSTRAINT opac_docs_dig_pkey PRIMARY KEY (signatura);


--
-- Name: opac_editorial opac_editorial_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.opac_editorial
    ADD CONSTRAINT opac_editorial_pkey PRIMARY KEY (id);


--
-- Name: opac_idioma opac_idioma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.opac_idioma
    ADD CONSTRAINT opac_idioma_pkey PRIMARY KEY (id);


--
-- Name: opac_institucion opac_institucion_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.opac_institucion
    ADD CONSTRAINT opac_institucion_pkey PRIMARY KEY (id);


--
-- Name: opac_libro_legacy_descriptores opac_libro_legacy_descri_opaclibro_id_opacdescrip_21169b4f_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.opac_libro_legacy_descriptores
    ADD CONSTRAINT opac_libro_legacy_descri_opaclibro_id_opacdescrip_21169b4f_uniq UNIQUE (opaclibro_id, opacdescriptor_id);


--
-- Name: opac_libro_legacy_descriptores opac_libro_legacy_descriptores_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.opac_libro_legacy_descriptores
    ADD CONSTRAINT opac_libro_legacy_descriptores_pkey PRIMARY KEY (id);


--
-- Name: opac_libro_legacy opac_libro_legacy_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.opac_libro_legacy
    ADD CONSTRAINT opac_libro_legacy_pkey PRIMARY KEY (no_reg);


--
-- Name: opac_libro_migration opac_libro_migration_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.opac_libro_migration
    ADD CONSTRAINT opac_libro_migration_pkey PRIMARY KEY (no_reg);


--
-- Name: opac_libro_participacion_especial opac_libro_participacion_especial_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.opac_libro_participacion_especial
    ADD CONSTRAINT opac_libro_participacion_especial_pkey PRIMARY KEY (id);


--
-- Name: opac_marc2 opac_marc2_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.opac_marc2
    ADD CONSTRAINT opac_marc2_pkey PRIMARY KEY (id);


--
-- Name: opac_marc opac_marc_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.opac_marc
    ADD CONSTRAINT opac_marc_pkey PRIMARY KEY (id);


--
-- Name: opac_materias opac_materias_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.opac_materias
    ADD CONSTRAINT opac_materias_pkey PRIMARY KEY (id);


--
-- Name: opac_pais opac_pais_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.opac_pais
    ADD CONSTRAINT opac_pais_pkey PRIMARY KEY (id);


--
-- Name: opac_revs_articulo_descriptores opac_revs_articulo_descr_opacrevsarticulo_id_opac_1a5ef283_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.opac_revs_articulo_descriptores
    ADD CONSTRAINT opac_revs_articulo_descr_opacrevsarticulo_id_opac_1a5ef283_uniq UNIQUE (opacrevsarticulo_id, opacdescriptor_id);


--
-- Name: opac_revs_articulo_descriptores opac_revs_articulo_descriptores_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.opac_revs_articulo_descriptores
    ADD CONSTRAINT opac_revs_articulo_descriptores_pkey PRIMARY KEY (id);


--
-- Name: opac_revs_articulo opac_revs_articulo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.opac_revs_articulo
    ADD CONSTRAINT opac_revs_articulo_pkey PRIMARY KEY (id);


--
-- Name: opac_revs_ejemplar opac_revs_ejemplar_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.opac_revs_ejemplar
    ADD CONSTRAINT opac_revs_ejemplar_pkey PRIMARY KEY (no_reg);


--
-- Name: opac_soporte opac_soporte_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.opac_soporte
    ADD CONSTRAINT opac_soporte_pkey PRIMARY KEY (id);


--
-- Name: opac_temp_prestados opac_temp_prestados_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.opac_temp_prestados
    ADD CONSTRAINT opac_temp_prestados_pkey PRIMARY KEY (id);


--
-- Name: opac_tesis_autor opac_tesis_autor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.opac_tesis_autor
    ADD CONSTRAINT opac_tesis_autor_pkey PRIMARY KEY (id);


--
-- Name: opac_tesis_descriptores opac_tesis_descriptores_opactesis_id_opacdescrip_b0adb634_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.opac_tesis_descriptores
    ADD CONSTRAINT opac_tesis_descriptores_opactesis_id_opacdescrip_b0adb634_uniq UNIQUE (opactesis_id, opacdescriptor_id);


--
-- Name: opac_tesis_descriptores opac_tesis_descriptores_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.opac_tesis_descriptores
    ADD CONSTRAINT opac_tesis_descriptores_pkey PRIMARY KEY (id);


--
-- Name: opac_tesis opac_tesis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.opac_tesis
    ADD CONSTRAINT opac_tesis_pkey PRIMARY KEY (signatura);


--
-- Name: opac_tipo_doc_dig opac_tipo_doc_dig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.opac_tipo_doc_dig
    ADD CONSTRAINT opac_tipo_doc_dig_pkey PRIMARY KEY (id);


--
-- Name: opac_usuario opac_usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.opac_usuario
    ADD CONSTRAINT opac_usuario_pkey PRIMARY KEY (carnet);


--
-- Name: rec_digs_asignatura rec_digs_asignatura_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rec_digs_asignatura
    ADD CONSTRAINT rec_digs_asignatura_pkey PRIMARY KEY (id);


--
-- Name: rec_digs_recursos recep_rec_digitales_recursodigital_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rec_digs_recursos
    ADD CONSTRAINT recep_rec_digitales_recursodigital_pkey PRIMARY KEY (no_reg);


--
-- Name: rec_digs_tipo recep_rec_digitales_tiporecurso_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rec_digs_tipo
    ADD CONSTRAINT recep_rec_digitales_tiporecurso_pkey PRIMARY KEY (id);


--
-- Name: reg_usuarios reg_usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reg_usuarios
    ADD CONSTRAINT reg_usuarios_pkey PRIMARY KEY ("No");


--
-- Name: reportes reportes_reportes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reportes
    ADD CONSTRAINT reportes_reportes_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: authtoken_token_key_10f0b77e_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX authtoken_token_key_10f0b77e_like ON public.authtoken_token USING btree (key varchar_pattern_ops);


--
-- Name: chat_chatsession_owner_id_aec267f8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX chat_chatsession_owner_id_aec267f8 ON public.chat_chatsession USING btree (owner_id);


--
-- Name: chat_chatsessionmember_chat_session_id_ce4150e8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX chat_chatsessionmember_chat_session_id_ce4150e8 ON public.chat_chatsessionmember USING btree (chat_session_id);


--
-- Name: chat_chatsessionmember_user_id_0c3aee51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX chat_chatsessionmember_user_id_0c3aee51 ON public.chat_chatsessionmember USING btree (user_id);


--
-- Name: chat_chatsessionmessage_chat_session_id_377a3b7c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX chat_chatsessionmessage_chat_session_id_377a3b7c ON public.chat_chatsessionmessage USING btree (chat_session_id);


--
-- Name: chat_chatsessionmessage_user_id_b5f88be1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX chat_chatsessionmessage_user_id_b5f88be1 ON public.chat_chatsessionmessage USING btree (user_id);


--
-- Name: contab_adquisicion_nombre_vendedor_id_cfa32c43; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX contab_adquisicion_nombre_vendedor_id_cfa32c43 ON public.contab_adquisicion USING btree (nombre_vendedor_id);


--
-- Name: contab_contrato_numero_contrato_c2831b6c_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX contab_contrato_numero_contrato_c2831b6c_like ON public.contab_contrato USING btree (numero_contrato varchar_pattern_ops);


--
-- Name: contab_presupuesto_periodo_id_7c0cec37; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX contab_presupuesto_periodo_id_7c0cec37 ON public.contab_presupuesto USING btree (periodo_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: knox_authtoken_digest_188c7e77_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX knox_authtoken_digest_188c7e77_like ON public.knox_authtoken USING btree (digest varchar_pattern_ops);


--
-- Name: knox_authtoken_salt_3d9f48ac_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX knox_authtoken_salt_3d9f48ac_like ON public.knox_authtoken USING btree (salt varchar_pattern_ops);


--
-- Name: knox_authtoken_token_key_8f4f7d47; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX knox_authtoken_token_key_8f4f7d47 ON public.knox_authtoken USING btree (token_key);


--
-- Name: knox_authtoken_token_key_8f4f7d47_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX knox_authtoken_token_key_8f4f7d47_like ON public.knox_authtoken USING btree (token_key varchar_pattern_ops);


--
-- Name: knox_authtoken_user_id_e5a5d899; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX knox_authtoken_user_id_e5a5d899 ON public.knox_authtoken USING btree (user_id);


--
-- Name: opac_ciudades_nombre_pais_id_4289f033; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX opac_ciudades_nombre_pais_id_4289f033 ON public.opac_ciudades USING btree (nombre_pais_id);


--
-- Name: opac_docs_dig_autor2_id_81961185; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX opac_docs_dig_autor2_id_81961185 ON public.opac_docs_dig USING btree (autor2_id);


--
-- Name: opac_docs_dig_autor3_id_5fd4c624; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX opac_docs_dig_autor3_id_5fd4c624 ON public.opac_docs_dig USING btree (autor3_id);


--
-- Name: opac_docs_dig_autor_id_1e842387; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX opac_docs_dig_autor_id_1e842387 ON public.opac_docs_dig USING btree (autor_id);


--
-- Name: opac_docs_dig_descriptor_id_c70fa5e7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX opac_docs_dig_descriptor_id_c70fa5e7 ON public.opac_docs_dig USING btree (descriptor_id);


--
-- Name: opac_docs_dig_editorial_id_dff98f09; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX opac_docs_dig_editorial_id_dff98f09 ON public.opac_docs_dig USING btree (editorial_id);


--
-- Name: opac_docs_dig_signatura_e12b2b31_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX opac_docs_dig_signatura_e12b2b31_like ON public.opac_docs_dig USING btree (signatura varchar_pattern_ops);


--
-- Name: opac_docs_dig_tipo_documento_id_4918399f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX opac_docs_dig_tipo_documento_id_4918399f ON public.opac_docs_dig USING btree (tipo_documento_digital_id);


--
-- Name: opac_editorial_pais_origen_id_af5fc94e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX opac_editorial_pais_origen_id_af5fc94e ON public.opac_editorial USING btree (pais_origen_id);


--
-- Name: opac_libro_legacy_autor3_id_8c23f403; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX opac_libro_legacy_autor3_id_8c23f403 ON public.opac_libro_legacy USING btree (autor3_id);


--
-- Name: opac_libro_legacy_descriptores_opacdescriptor_id_e92be321; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX opac_libro_legacy_descriptores_opacdescriptor_id_e92be321 ON public.opac_libro_legacy_descriptores USING btree (opacdescriptor_id);


--
-- Name: opac_libro_legacy_descriptores_opaclibro_id_b60f5490; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX opac_libro_legacy_descriptores_opaclibro_id_b60f5490 ON public.opac_libro_legacy_descriptores USING btree (opaclibro_id);


--
-- Name: opac_libro_legacy_editorial_id_e1ef03b0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX opac_libro_legacy_editorial_id_e1ef03b0 ON public.opac_libro_legacy USING btree (editorial_id);


--
-- Name: opac_libro_legacy_idioma_id_ccd5676a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX opac_libro_legacy_idioma_id_ccd5676a ON public.opac_libro_legacy USING btree (idioma_id);


--
-- Name: opac_libro_legacy_lugar_de_impresion_id_32dcac33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX opac_libro_legacy_lugar_de_impresion_id_32dcac33 ON public.opac_libro_legacy USING btree ("lugar_de_impresión_id");


--
-- Name: opac_libro_legacy_tipo_soporte_id_c7e574a8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX opac_libro_legacy_tipo_soporte_id_c7e574a8 ON public.opac_libro_legacy USING btree (tipo_soporte_id);


--
-- Name: opac_revs_articulo_autor2_id_7375c806; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX opac_revs_articulo_autor2_id_7375c806 ON public.opac_revs_articulo USING btree (autor2_id);


--
-- Name: opac_revs_articulo_autor3_id_82b3781e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX opac_revs_articulo_autor3_id_82b3781e ON public.opac_revs_articulo USING btree (autor3_id);


--
-- Name: opac_revs_articulo_autor4_id_d4556cb5; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX opac_revs_articulo_autor4_id_d4556cb5 ON public.opac_revs_articulo USING btree (autor4_id);


--
-- Name: opac_revs_articulo_autor_id_16a18349; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX opac_revs_articulo_autor_id_16a18349 ON public.opac_revs_articulo USING btree (autor_id);


--
-- Name: opac_revs_articulo_descriptores_opacdescriptor_id_94c65f93; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX opac_revs_articulo_descriptores_opacdescriptor_id_94c65f93 ON public.opac_revs_articulo_descriptores USING btree (opacdescriptor_id);


--
-- Name: opac_revs_articulo_descriptores_opacrevsarticulo_id_7ae1595b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX opac_revs_articulo_descriptores_opacrevsarticulo_id_7ae1595b ON public.opac_revs_articulo_descriptores USING btree (opacrevsarticulo_id);


--
-- Name: opac_revs_articulo_nombre_revista_id_d7349f08; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX opac_revs_articulo_nombre_revista_id_d7349f08 ON public.opac_revs_articulo USING btree (nombre_revista_id);


--
-- Name: opac_revs_ejemplar_editorial_id_a5f81133; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX opac_revs_ejemplar_editorial_id_a5f81133 ON public.opac_revs_ejemplar USING btree (editorial_id);


--
-- Name: opac_revs_ejemplar_institución_id_c397ee89; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "opac_revs_ejemplar_institución_id_c397ee89" ON public.opac_revs_ejemplar USING btree ("institución_id");


--
-- Name: opac_revs_ejemplar_nombre_materia_id_410e56a3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX opac_revs_ejemplar_nombre_materia_id_410e56a3 ON public.opac_revs_ejemplar USING btree (nombre_materia_id);


--
-- Name: opac_revs_ejemplar_signatura_d2a40e89_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX opac_revs_ejemplar_signatura_d2a40e89_like ON public.opac_revs_ejemplar USING btree (signatura varchar_pattern_ops);


--
-- Name: opac_tesis_autor1_tesis_id_354311df; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX opac_tesis_autor1_tesis_id_354311df ON public.opac_tesis USING btree (autor_id);


--
-- Name: opac_tesis_autor2_tesis_id_7cb46fd8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX opac_tesis_autor2_tesis_id_7cb46fd8 ON public.opac_tesis USING btree (autor2_id);


--
-- Name: opac_tesis_catedra_id_ef39563c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX opac_tesis_catedra_id_ef39563c ON public.opac_tesis USING btree ("cátedra_id");


--
-- Name: opac_tesis_descriptores_opacdescriptor_id_56054976; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX opac_tesis_descriptores_opacdescriptor_id_56054976 ON public.opac_tesis_descriptores USING btree (opacdescriptor_id);


--
-- Name: opac_tesis_descriptores_opactesis_id_1f18d779; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX opac_tesis_descriptores_opactesis_id_1f18d779 ON public.opac_tesis_descriptores USING btree (opactesis_id);


--
-- Name: opac_tesis_descriptores_opactesis_id_1f18d779_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX opac_tesis_descriptores_opactesis_id_1f18d779_like ON public.opac_tesis_descriptores USING btree (opactesis_id varchar_pattern_ops);


--
-- Name: opac_tesis_disciplina_id_7d43507a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX opac_tesis_disciplina_id_7d43507a ON public.opac_tesis USING btree (disciplina_id);


--
-- Name: opac_tesis_institución_id_6e2f6c2d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "opac_tesis_institución_id_6e2f6c2d" ON public.opac_tesis USING btree ("institución_id");


--
-- Name: opac_tesis_signatura_818837fe_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX opac_tesis_signatura_818837fe_like ON public.opac_tesis USING btree (signatura varchar_pattern_ops);


--
-- Name: opac_usuario_carnet_b158b97f_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX opac_usuario_carnet_b158b97f_like ON public.opac_usuario USING btree (carnet varchar_pattern_ops);


--
-- Name: rec_digs_recursos_institucion_id_c3b91520; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX rec_digs_recursos_institucion_id_c3b91520 ON public.rec_digs_recursos USING btree (institucion_id);


--
-- Name: recep_rec_digitales_recursodigital_tipo_recurso_id_07cfb0a4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX recep_rec_digitales_recursodigital_tipo_recurso_id_07cfb0a4 ON public.rec_digs_recursos USING btree (tipo_recurso_id);


--
-- Name: reg_usuarios_institucion_id_cc5d238b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX reg_usuarios_institucion_id_cc5d238b ON public.reg_usuarios USING btree (institucion_id);


--
-- Name: reg_usuarios_recurso_prestamo_id_9ae93a91; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX reg_usuarios_recurso_prestamo_id_9ae93a91 ON public.reg_usuarios USING btree (recurso_prestamo_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authtoken_token authtoken_token_user_id_35299eff_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_35299eff_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: chat_chatsession chat_chatsession_owner_id_aec267f8_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.chat_chatsession
    ADD CONSTRAINT chat_chatsession_owner_id_aec267f8_fk_auth_user_id FOREIGN KEY (owner_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: chat_chatsessionmember chat_chatsessionmemb_chat_session_id_ce4150e8_fk_chat_chat; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.chat_chatsessionmember
    ADD CONSTRAINT chat_chatsessionmemb_chat_session_id_ce4150e8_fk_chat_chat FOREIGN KEY (chat_session_id) REFERENCES public.chat_chatsession(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: chat_chatsessionmember chat_chatsessionmember_user_id_0c3aee51_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.chat_chatsessionmember
    ADD CONSTRAINT chat_chatsessionmember_user_id_0c3aee51_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: chat_chatsessionmessage chat_chatsessionmess_chat_session_id_377a3b7c_fk_chat_chat; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.chat_chatsessionmessage
    ADD CONSTRAINT chat_chatsessionmess_chat_session_id_377a3b7c_fk_chat_chat FOREIGN KEY (chat_session_id) REFERENCES public.chat_chatsession(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: chat_chatsessionmessage chat_chatsessionmessage_user_id_b5f88be1_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.chat_chatsessionmessage
    ADD CONSTRAINT chat_chatsessionmessage_user_id_b5f88be1_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: contab_adquisicion contab_adquisicion_nombre_vendedor_id_cfa32c43_fk_contab_ad; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contab_adquisicion
    ADD CONSTRAINT contab_adquisicion_nombre_vendedor_id_cfa32c43_fk_contab_ad FOREIGN KEY (nombre_vendedor_id) REFERENCES public.contab_adq_vendedor(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: contab_presupuesto contab_presupuesto_periodo_id_7c0cec37_fk_contab_pr; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contab_presupuesto
    ADD CONSTRAINT contab_presupuesto_periodo_id_7c0cec37_fk_contab_pr FOREIGN KEY (periodo_id) REFERENCES public.contab_presupuesto_periodo(id_periodo) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: knox_authtoken knox_authtoken_user_id_e5a5d899_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.knox_authtoken
    ADD CONSTRAINT knox_authtoken_user_id_e5a5d899_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: opac_ciudades opac_ciudades_nombre_pais_id_4289f033_fk_opac_pais_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.opac_ciudades
    ADD CONSTRAINT opac_ciudades_nombre_pais_id_4289f033_fk_opac_pais_id FOREIGN KEY (nombre_pais_id) REFERENCES public.opac_pais(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: opac_docs_dig opac_docs_dig_autor2_id_81961185_fk_opac_autor_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.opac_docs_dig
    ADD CONSTRAINT opac_docs_dig_autor2_id_81961185_fk_opac_autor_id FOREIGN KEY (autor2_id) REFERENCES public.opac_autor(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: opac_docs_dig opac_docs_dig_autor3_id_5fd4c624_fk_opac_autor_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.opac_docs_dig
    ADD CONSTRAINT opac_docs_dig_autor3_id_5fd4c624_fk_opac_autor_id FOREIGN KEY (autor3_id) REFERENCES public.opac_autor(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: opac_docs_dig opac_docs_dig_autor_id_1e842387_fk_opac_autor_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.opac_docs_dig
    ADD CONSTRAINT opac_docs_dig_autor_id_1e842387_fk_opac_autor_id FOREIGN KEY (autor_id) REFERENCES public.opac_autor(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: opac_docs_dig opac_docs_dig_descriptor_id_c70fa5e7_fk_opac_descriptor_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.opac_docs_dig
    ADD CONSTRAINT opac_docs_dig_descriptor_id_c70fa5e7_fk_opac_descriptor_id FOREIGN KEY (descriptor_id) REFERENCES public.opac_descriptores_migration(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: opac_docs_dig opac_docs_dig_editorial_id_dff98f09_fk_opac_editorial_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.opac_docs_dig
    ADD CONSTRAINT opac_docs_dig_editorial_id_dff98f09_fk_opac_editorial_id FOREIGN KEY (editorial_id) REFERENCES public.opac_editorial(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: opac_docs_dig opac_docs_dig_tipo_documento_digit_79f63b0c_fk_opac_tipo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.opac_docs_dig
    ADD CONSTRAINT opac_docs_dig_tipo_documento_digit_79f63b0c_fk_opac_tipo FOREIGN KEY (tipo_documento_digital_id) REFERENCES public.opac_tipo_doc_dig(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: opac_editorial opac_editorial_pais_origen_id_af5fc94e_fk_opac_pais_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.opac_editorial
    ADD CONSTRAINT opac_editorial_pais_origen_id_af5fc94e_fk_opac_pais_id FOREIGN KEY (pais_origen_id) REFERENCES public.opac_pais(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: opac_libro_legacy opac_libro_legacy_autor2_id_b7c37fdb_fk_opac_autor_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.opac_libro_legacy
    ADD CONSTRAINT opac_libro_legacy_autor2_id_b7c37fdb_fk_opac_autor_id FOREIGN KEY (autor2_id) REFERENCES public.opac_autor(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: opac_libro_legacy opac_libro_legacy_autor3_id_8c23f403_fk_opac_autor_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.opac_libro_legacy
    ADD CONSTRAINT opac_libro_legacy_autor3_id_8c23f403_fk_opac_autor_id FOREIGN KEY (autor3_id) REFERENCES public.opac_autor(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: opac_libro_legacy opac_libro_legacy_autor_id_32ded19f_fk_opac_autor_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.opac_libro_legacy
    ADD CONSTRAINT opac_libro_legacy_autor_id_32ded19f_fk_opac_autor_id FOREIGN KEY (autor_id) REFERENCES public.opac_autor(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: opac_libro_legacy_descriptores opac_libro_legacy_de_opacdescriptor_id_e92be321_fk_opac_desc; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.opac_libro_legacy_descriptores
    ADD CONSTRAINT opac_libro_legacy_de_opacdescriptor_id_e92be321_fk_opac_desc FOREIGN KEY (opacdescriptor_id) REFERENCES public.opac_descriptores_migration_1(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: opac_libro_legacy_descriptores opac_libro_legacy_de_opaclibro_id_b60f5490_fk_opac_libr; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.opac_libro_legacy_descriptores
    ADD CONSTRAINT opac_libro_legacy_de_opaclibro_id_b60f5490_fk_opac_libr FOREIGN KEY (opaclibro_id) REFERENCES public.opac_libro_legacy(no_reg) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: opac_libro_legacy opac_libro_legacy_editorial_id_e1ef03b0_fk_opac_editorial_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.opac_libro_legacy
    ADD CONSTRAINT opac_libro_legacy_editorial_id_e1ef03b0_fk_opac_editorial_id FOREIGN KEY (editorial_id) REFERENCES public.opac_editorial(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: opac_libro_legacy opac_libro_legacy_idioma_id_ccd5676a_fk_opac_idioma_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.opac_libro_legacy
    ADD CONSTRAINT opac_libro_legacy_idioma_id_ccd5676a_fk_opac_idioma_id FOREIGN KEY (idioma_id) REFERENCES public.opac_idioma(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: opac_libro_legacy opac_libro_legacy_lugar_de_impresión_i_011eece9_fk_opac_ciud; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.opac_libro_legacy
    ADD CONSTRAINT "opac_libro_legacy_lugar_de_impresión_i_011eece9_fk_opac_ciud" FOREIGN KEY ("lugar_de_impresión_id") REFERENCES public.opac_ciudades(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: opac_libro_legacy opac_libro_legacy_tipo_soporte_id_c7e574a8_fk_opac_soporte_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.opac_libro_legacy
    ADD CONSTRAINT opac_libro_legacy_tipo_soporte_id_c7e574a8_fk_opac_soporte_id FOREIGN KEY (tipo_soporte_id) REFERENCES public.opac_soporte(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: opac_revs_articulo opac_rev_articulo_nombre_revista_id_982f6d45_fk_opac_rev_ejempl; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.opac_revs_articulo
    ADD CONSTRAINT opac_rev_articulo_nombre_revista_id_982f6d45_fk_opac_rev_ejempl FOREIGN KEY (nombre_revista_id) REFERENCES public.opac_revs_ejemplar(no_reg);


--
-- Name: opac_revs_ejemplar opac_rev_ejemplar_nombre_materia_id_410e56a3_fk_opac_materias_i; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.opac_revs_ejemplar
    ADD CONSTRAINT opac_rev_ejemplar_nombre_materia_id_410e56a3_fk_opac_materias_i FOREIGN KEY (nombre_materia_id) REFERENCES public.opac_materias(id);


--
-- Name: opac_revs_articulo opac_revs_articulo_autor2_id_7375c806_fk_opac_autor_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.opac_revs_articulo
    ADD CONSTRAINT opac_revs_articulo_autor2_id_7375c806_fk_opac_autor_id FOREIGN KEY (autor2_id) REFERENCES public.opac_autor(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: opac_revs_articulo opac_revs_articulo_autor3_id_82b3781e_fk_opac_autor_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.opac_revs_articulo
    ADD CONSTRAINT opac_revs_articulo_autor3_id_82b3781e_fk_opac_autor_id FOREIGN KEY (autor3_id) REFERENCES public.opac_autor(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: opac_revs_articulo opac_revs_articulo_autor4_id_d4556cb5_fk_opac_autor_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.opac_revs_articulo
    ADD CONSTRAINT opac_revs_articulo_autor4_id_d4556cb5_fk_opac_autor_id FOREIGN KEY (autor4_id) REFERENCES public.opac_autor(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: opac_revs_articulo opac_revs_articulo_autor_id_16a18349_fk_opac_autor_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.opac_revs_articulo
    ADD CONSTRAINT opac_revs_articulo_autor_id_16a18349_fk_opac_autor_id FOREIGN KEY (autor_id) REFERENCES public.opac_autor(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: opac_revs_articulo_descriptores opac_revs_articulo_d_opacdescriptor_id_94c65f93_fk_opac_desc; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.opac_revs_articulo_descriptores
    ADD CONSTRAINT opac_revs_articulo_d_opacdescriptor_id_94c65f93_fk_opac_desc FOREIGN KEY (opacdescriptor_id) REFERENCES public.opac_descriptores_migration_1(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: opac_revs_articulo_descriptores opac_revs_articulo_d_opacrevsarticulo_id_7ae1595b_fk_opac_revs; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.opac_revs_articulo_descriptores
    ADD CONSTRAINT opac_revs_articulo_d_opacrevsarticulo_id_7ae1595b_fk_opac_revs FOREIGN KEY (opacrevsarticulo_id) REFERENCES public.opac_revs_articulo(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: opac_revs_ejemplar opac_revs_ejemplar_editorial_id_a5f81133_fk_opac_editorial_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.opac_revs_ejemplar
    ADD CONSTRAINT opac_revs_ejemplar_editorial_id_a5f81133_fk_opac_editorial_id FOREIGN KEY (editorial_id) REFERENCES public.opac_editorial(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: opac_revs_ejemplar opac_revs_ejemplar_institución_id_c397ee89_fk_opac_inst; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.opac_revs_ejemplar
    ADD CONSTRAINT "opac_revs_ejemplar_institución_id_c397ee89_fk_opac_inst" FOREIGN KEY ("institución_id") REFERENCES public.opac_institucion(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: opac_tesis opac_tesis_autor2_id_85d117e7_fk_opac_tesis_autor_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.opac_tesis
    ADD CONSTRAINT opac_tesis_autor2_id_85d117e7_fk_opac_tesis_autor_id FOREIGN KEY (autor_id) REFERENCES public.opac_tesis_autor(id);


--
-- Name: opac_tesis opac_tesis_autor_id_50086ba7_fk_opac_tesis_autor_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.opac_tesis
    ADD CONSTRAINT opac_tesis_autor_id_50086ba7_fk_opac_tesis_autor_id FOREIGN KEY (autor_id) REFERENCES public.opac_tesis_autor(id);


--
-- Name: opac_tesis opac_tesis_cátedra_id_61cbb289_fk_opac_catedra_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.opac_tesis
    ADD CONSTRAINT "opac_tesis_cátedra_id_61cbb289_fk_opac_catedra_id" FOREIGN KEY ("cátedra_id") REFERENCES public.opac_catedra(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: opac_tesis_descriptores opac_tesis_descripto_opacdescriptor_id_56054976_fk_opac_desc; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.opac_tesis_descriptores
    ADD CONSTRAINT opac_tesis_descripto_opacdescriptor_id_56054976_fk_opac_desc FOREIGN KEY (opacdescriptor_id) REFERENCES public.opac_descriptores_migration_1(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: opac_tesis_descriptores opac_tesis_descripto_opactesis_id_1f18d779_fk_opac_tesi; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.opac_tesis_descriptores
    ADD CONSTRAINT opac_tesis_descripto_opactesis_id_1f18d779_fk_opac_tesi FOREIGN KEY (opactesis_id) REFERENCES public.opac_tesis(signatura) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: opac_tesis opac_tesis_disciplina_id_7d43507a_fk_opac_materias_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.opac_tesis
    ADD CONSTRAINT opac_tesis_disciplina_id_7d43507a_fk_opac_materias_id FOREIGN KEY (disciplina_id) REFERENCES public.opac_materias(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: opac_tesis opac_tesis_institución_id_6e2f6c2d_fk_opac_institucion_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.opac_tesis
    ADD CONSTRAINT "opac_tesis_institución_id_6e2f6c2d_fk_opac_institucion_id" FOREIGN KEY ("institución_id") REFERENCES public.opac_institucion(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rec_digs_recursos rec_digs_recursos_institucion_id_c3b91520_fk_opac_inst; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rec_digs_recursos
    ADD CONSTRAINT rec_digs_recursos_institucion_id_c3b91520_fk_opac_inst FOREIGN KEY (institucion_id) REFERENCES public.opac_institucion(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rec_digs_recursos recep_rec_digitales__tipo_recurso_id_07cfb0a4_fk_recep_rec; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rec_digs_recursos
    ADD CONSTRAINT recep_rec_digitales__tipo_recurso_id_07cfb0a4_fk_recep_rec FOREIGN KEY (tipo_recurso_id) REFERENCES public.rec_digs_tipo(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reg_usuarios reg_usuarios_institucion_id_cc5d238b_fk_opac_institucion_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reg_usuarios
    ADD CONSTRAINT reg_usuarios_institucion_id_cc5d238b_fk_opac_institucion_id FOREIGN KEY (institucion_id) REFERENCES public.opac_institucion(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reg_usuarios reg_usuarios_recurso_prestamo_id_9ae93a91_fk_opac_libr; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reg_usuarios
    ADD CONSTRAINT reg_usuarios_recurso_prestamo_id_9ae93a91_fk_opac_libr FOREIGN KEY (recurso_prestamo_id) REFERENCES public.opac_libro_legacy(no_reg) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

