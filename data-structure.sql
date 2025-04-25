/*
 Navicat Premium Data Transfer

 Source Server         : Formular 1
 Source Server Type    : PostgreSQL
 Source Server Version : 170004 (170004)
 Source Host           : localhost:5432
 Source Catalog        : f1_database
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 170004 (170004)
 File Encoding         : 65001

 Date: 24/04/2025 23:18:13
*/


-- ----------------------------
-- Sequence structure for ab_permission_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ab_permission_id_seq";
CREATE SEQUENCE "public"."ab_permission_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ab_permission_view_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ab_permission_view_id_seq";
CREATE SEQUENCE "public"."ab_permission_view_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ab_permission_view_role_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ab_permission_view_role_id_seq";
CREATE SEQUENCE "public"."ab_permission_view_role_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ab_register_user_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ab_register_user_id_seq";
CREATE SEQUENCE "public"."ab_register_user_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ab_role_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ab_role_id_seq";
CREATE SEQUENCE "public"."ab_role_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ab_user_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ab_user_id_seq";
CREATE SEQUENCE "public"."ab_user_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ab_user_role_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ab_user_role_id_seq";
CREATE SEQUENCE "public"."ab_user_role_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ab_view_menu_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ab_view_menu_id_seq";
CREATE SEQUENCE "public"."ab_view_menu_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for callback_request_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."callback_request_id_seq";
CREATE SEQUENCE "public"."callback_request_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for connection_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."connection_id_seq";
CREATE SEQUENCE "public"."connection_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for dag_pickle_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."dag_pickle_id_seq";
CREATE SEQUENCE "public"."dag_pickle_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for dag_run_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."dag_run_id_seq";
CREATE SEQUENCE "public"."dag_run_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for dataset_alias_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."dataset_alias_id_seq";
CREATE SEQUENCE "public"."dataset_alias_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for dataset_event_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."dataset_event_id_seq";
CREATE SEQUENCE "public"."dataset_event_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for dataset_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."dataset_id_seq";
CREATE SEQUENCE "public"."dataset_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for import_error_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."import_error_id_seq";
CREATE SEQUENCE "public"."import_error_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for job_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."job_id_seq";
CREATE SEQUENCE "public"."job_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for log_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."log_id_seq";
CREATE SEQUENCE "public"."log_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for log_template_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."log_template_id_seq";
CREATE SEQUENCE "public"."log_template_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for session_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."session_id_seq";
CREATE SEQUENCE "public"."session_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for slot_pool_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."slot_pool_id_seq";
CREATE SEQUENCE "public"."slot_pool_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for task_fail_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."task_fail_id_seq";
CREATE SEQUENCE "public"."task_fail_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for task_instance_history_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."task_instance_history_id_seq";
CREATE SEQUENCE "public"."task_instance_history_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for task_reschedule_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."task_reschedule_id_seq";
CREATE SEQUENCE "public"."task_reschedule_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for trigger_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."trigger_id_seq";
CREATE SEQUENCE "public"."trigger_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for variable_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."variable_id_seq";
CREATE SEQUENCE "public"."variable_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Table structure for ab_permission
-- ----------------------------
DROP TABLE IF EXISTS "public"."ab_permission";
CREATE TABLE "public"."ab_permission" (
  "id" int4 NOT NULL DEFAULT nextval('ab_permission_id_seq'::regclass),
  "name" varchar(100) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Table structure for ab_permission_view
-- ----------------------------
DROP TABLE IF EXISTS "public"."ab_permission_view";
CREATE TABLE "public"."ab_permission_view" (
  "id" int4 NOT NULL DEFAULT nextval('ab_permission_view_id_seq'::regclass),
  "permission_id" int4,
  "view_menu_id" int4
)
;

-- ----------------------------
-- Table structure for ab_permission_view_role
-- ----------------------------
DROP TABLE IF EXISTS "public"."ab_permission_view_role";
CREATE TABLE "public"."ab_permission_view_role" (
  "id" int4 NOT NULL DEFAULT nextval('ab_permission_view_role_id_seq'::regclass),
  "permission_view_id" int4,
  "role_id" int4
)
;

-- ----------------------------
-- Table structure for ab_register_user
-- ----------------------------
DROP TABLE IF EXISTS "public"."ab_register_user";
CREATE TABLE "public"."ab_register_user" (
  "id" int4 NOT NULL DEFAULT nextval('ab_register_user_id_seq'::regclass),
  "first_name" varchar(256) COLLATE "pg_catalog"."default" NOT NULL,
  "last_name" varchar(256) COLLATE "pg_catalog"."default" NOT NULL,
  "username" varchar(512) COLLATE "pg_catalog"."default" NOT NULL,
  "password" varchar(256) COLLATE "pg_catalog"."default",
  "email" varchar(512) COLLATE "pg_catalog"."default" NOT NULL,
  "registration_date" timestamp(6),
  "registration_hash" varchar(256) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for ab_role
-- ----------------------------
DROP TABLE IF EXISTS "public"."ab_role";
CREATE TABLE "public"."ab_role" (
  "id" int4 NOT NULL DEFAULT nextval('ab_role_id_seq'::regclass),
  "name" varchar(64) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Table structure for ab_user
-- ----------------------------
DROP TABLE IF EXISTS "public"."ab_user";
CREATE TABLE "public"."ab_user" (
  "id" int4 NOT NULL DEFAULT nextval('ab_user_id_seq'::regclass),
  "first_name" varchar(256) COLLATE "pg_catalog"."default" NOT NULL,
  "last_name" varchar(256) COLLATE "pg_catalog"."default" NOT NULL,
  "username" varchar(512) COLLATE "pg_catalog"."default" NOT NULL,
  "password" varchar(256) COLLATE "pg_catalog"."default",
  "active" bool,
  "email" varchar(512) COLLATE "pg_catalog"."default" NOT NULL,
  "last_login" timestamp(6),
  "login_count" int4,
  "fail_login_count" int4,
  "created_on" timestamp(6),
  "changed_on" timestamp(6),
  "created_by_fk" int4,
  "changed_by_fk" int4
)
;

-- ----------------------------
-- Table structure for ab_user_role
-- ----------------------------
DROP TABLE IF EXISTS "public"."ab_user_role";
CREATE TABLE "public"."ab_user_role" (
  "id" int4 NOT NULL DEFAULT nextval('ab_user_role_id_seq'::regclass),
  "user_id" int4,
  "role_id" int4
)
;

-- ----------------------------
-- Table structure for ab_view_menu
-- ----------------------------
DROP TABLE IF EXISTS "public"."ab_view_menu";
CREATE TABLE "public"."ab_view_menu" (
  "id" int4 NOT NULL DEFAULT nextval('ab_view_menu_id_seq'::regclass),
  "name" varchar(250) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Table structure for alembic_version
-- ----------------------------
DROP TABLE IF EXISTS "public"."alembic_version";
CREATE TABLE "public"."alembic_version" (
  "version_num" varchar(32) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Table structure for callback_request
-- ----------------------------
DROP TABLE IF EXISTS "public"."callback_request";
CREATE TABLE "public"."callback_request" (
  "id" int4 NOT NULL DEFAULT nextval('callback_request_id_seq'::regclass),
  "created_at" timestamptz(6) NOT NULL,
  "priority_weight" int4 NOT NULL,
  "callback_data" json NOT NULL,
  "callback_type" varchar(20) COLLATE "pg_catalog"."default" NOT NULL,
  "processor_subdir" varchar(2000) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for circuits
-- ----------------------------
DROP TABLE IF EXISTS "public"."circuits";
CREATE TABLE "public"."circuits" (
  "circuitid" int4 NOT NULL,
  "circuitref" varchar(50) COLLATE "pg_catalog"."default",
  "name" varchar(100) COLLATE "pg_catalog"."default",
  "location" varchar(100) COLLATE "pg_catalog"."default",
  "country" varchar(50) COLLATE "pg_catalog"."default",
  "lat" numeric(9,6),
  "lng" numeric(9,6),
  "alt" int4,
  "url" text COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for connection
-- ----------------------------
DROP TABLE IF EXISTS "public"."connection";
CREATE TABLE "public"."connection" (
  "id" int4 NOT NULL DEFAULT nextval('connection_id_seq'::regclass),
  "conn_id" varchar(250) COLLATE "pg_catalog"."default" NOT NULL,
  "conn_type" varchar(500) COLLATE "pg_catalog"."default" NOT NULL,
  "description" text COLLATE "pg_catalog"."default",
  "host" varchar(500) COLLATE "pg_catalog"."default",
  "schema" varchar(500) COLLATE "pg_catalog"."default",
  "login" text COLLATE "pg_catalog"."default",
  "password" text COLLATE "pg_catalog"."default",
  "port" int4,
  "is_encrypted" bool,
  "is_extra_encrypted" bool,
  "extra" text COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for constructor_results
-- ----------------------------
DROP TABLE IF EXISTS "public"."constructor_results";
CREATE TABLE "public"."constructor_results" (
  "constructorresultsid" int4 NOT NULL,
  "raceid" int4,
  "constructorid" int4,
  "points" int4,
  "status" text COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for constructor_standings
-- ----------------------------
DROP TABLE IF EXISTS "public"."constructor_standings";
CREATE TABLE "public"."constructor_standings" (
  "constructorstandingsid" int4 NOT NULL,
  "raceid" int4,
  "constructorid" int4,
  "points" int4,
  "position" int4,
  "positiontext" varchar(5) COLLATE "pg_catalog"."default",
  "wins" int4
)
;

-- ----------------------------
-- Table structure for constructors
-- ----------------------------
DROP TABLE IF EXISTS "public"."constructors";
CREATE TABLE "public"."constructors" (
  "constructorid" int4 NOT NULL,
  "constructorref" varchar(50) COLLATE "pg_catalog"."default",
  "name" text COLLATE "pg_catalog"."default",
  "nationality" text COLLATE "pg_catalog"."default",
  "url" text COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for dag
-- ----------------------------
DROP TABLE IF EXISTS "public"."dag";
CREATE TABLE "public"."dag" (
  "dag_id" varchar(250) COLLATE "pg_catalog"."default" NOT NULL,
  "root_dag_id" varchar(250) COLLATE "pg_catalog"."default",
  "is_paused" bool,
  "is_subdag" bool,
  "is_active" bool,
  "last_parsed_time" timestamptz(6),
  "last_pickled" timestamptz(6),
  "last_expired" timestamptz(6),
  "scheduler_lock" bool,
  "pickle_id" int4,
  "fileloc" varchar(2000) COLLATE "pg_catalog"."default",
  "processor_subdir" varchar(2000) COLLATE "pg_catalog"."default",
  "owners" varchar(2000) COLLATE "pg_catalog"."default",
  "dag_display_name" varchar(2000) COLLATE "pg_catalog"."default",
  "description" text COLLATE "pg_catalog"."default",
  "default_view" varchar(25) COLLATE "pg_catalog"."default",
  "schedule_interval" text COLLATE "pg_catalog"."default",
  "timetable_description" varchar(1000) COLLATE "pg_catalog"."default",
  "dataset_expression" json,
  "max_active_tasks" int4 NOT NULL,
  "max_active_runs" int4,
  "max_consecutive_failed_dag_runs" int4 NOT NULL,
  "has_task_concurrency_limits" bool NOT NULL,
  "has_import_errors" bool DEFAULT false,
  "next_dagrun" timestamptz(6),
  "next_dagrun_data_interval_start" timestamptz(6),
  "next_dagrun_data_interval_end" timestamptz(6),
  "next_dagrun_create_after" timestamptz(6)
)
;

-- ----------------------------
-- Table structure for dag_code
-- ----------------------------
DROP TABLE IF EXISTS "public"."dag_code";
CREATE TABLE "public"."dag_code" (
  "fileloc_hash" int8 NOT NULL,
  "fileloc" varchar(2000) COLLATE "pg_catalog"."default" NOT NULL,
  "last_updated" timestamptz(6) NOT NULL,
  "source_code" text COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Table structure for dag_owner_attributes
-- ----------------------------
DROP TABLE IF EXISTS "public"."dag_owner_attributes";
CREATE TABLE "public"."dag_owner_attributes" (
  "dag_id" varchar(250) COLLATE "pg_catalog"."default" NOT NULL,
  "owner" varchar(500) COLLATE "pg_catalog"."default" NOT NULL,
  "link" varchar(500) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Table structure for dag_pickle
-- ----------------------------
DROP TABLE IF EXISTS "public"."dag_pickle";
CREATE TABLE "public"."dag_pickle" (
  "id" int4 NOT NULL DEFAULT nextval('dag_pickle_id_seq'::regclass),
  "pickle" bytea,
  "created_dttm" timestamptz(6),
  "pickle_hash" int8
)
;

-- ----------------------------
-- Table structure for dag_priority_parsing_request
-- ----------------------------
DROP TABLE IF EXISTS "public"."dag_priority_parsing_request";
CREATE TABLE "public"."dag_priority_parsing_request" (
  "id" varchar(32) COLLATE "pg_catalog"."default" NOT NULL,
  "fileloc" varchar(2000) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Table structure for dag_run
-- ----------------------------
DROP TABLE IF EXISTS "public"."dag_run";
CREATE TABLE "public"."dag_run" (
  "id" int4 NOT NULL DEFAULT nextval('dag_run_id_seq'::regclass),
  "dag_id" varchar(250) COLLATE "pg_catalog"."default" NOT NULL,
  "queued_at" timestamptz(6),
  "execution_date" timestamptz(6) NOT NULL,
  "start_date" timestamptz(6),
  "end_date" timestamptz(6),
  "state" varchar(50) COLLATE "pg_catalog"."default",
  "run_id" varchar(250) COLLATE "pg_catalog"."default" NOT NULL,
  "creating_job_id" int4,
  "external_trigger" bool,
  "run_type" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "conf" bytea,
  "data_interval_start" timestamptz(6),
  "data_interval_end" timestamptz(6),
  "last_scheduling_decision" timestamptz(6),
  "dag_hash" varchar(32) COLLATE "pg_catalog"."default",
  "log_template_id" int4,
  "updated_at" timestamptz(6),
  "clear_number" int4 NOT NULL DEFAULT 0
)
;

-- ----------------------------
-- Table structure for dag_run_note
-- ----------------------------
DROP TABLE IF EXISTS "public"."dag_run_note";
CREATE TABLE "public"."dag_run_note" (
  "user_id" int4,
  "dag_run_id" int4 NOT NULL,
  "content" varchar(1000) COLLATE "pg_catalog"."default",
  "created_at" timestamptz(6) NOT NULL,
  "updated_at" timestamptz(6) NOT NULL
)
;

-- ----------------------------
-- Table structure for dag_schedule_dataset_alias_reference
-- ----------------------------
DROP TABLE IF EXISTS "public"."dag_schedule_dataset_alias_reference";
CREATE TABLE "public"."dag_schedule_dataset_alias_reference" (
  "alias_id" int4 NOT NULL,
  "dag_id" varchar(250) COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamptz(6) NOT NULL,
  "updated_at" timestamptz(6) NOT NULL
)
;

-- ----------------------------
-- Table structure for dag_schedule_dataset_reference
-- ----------------------------
DROP TABLE IF EXISTS "public"."dag_schedule_dataset_reference";
CREATE TABLE "public"."dag_schedule_dataset_reference" (
  "dataset_id" int4 NOT NULL,
  "dag_id" varchar(250) COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamptz(6) NOT NULL,
  "updated_at" timestamptz(6) NOT NULL
)
;

-- ----------------------------
-- Table structure for dag_tag
-- ----------------------------
DROP TABLE IF EXISTS "public"."dag_tag";
CREATE TABLE "public"."dag_tag" (
  "name" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "dag_id" varchar(250) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Table structure for dag_warning
-- ----------------------------
DROP TABLE IF EXISTS "public"."dag_warning";
CREATE TABLE "public"."dag_warning" (
  "dag_id" varchar(250) COLLATE "pg_catalog"."default" NOT NULL,
  "warning_type" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "message" text COLLATE "pg_catalog"."default" NOT NULL,
  "timestamp" timestamptz(6) NOT NULL
)
;

-- ----------------------------
-- Table structure for dagrun_dataset_event
-- ----------------------------
DROP TABLE IF EXISTS "public"."dagrun_dataset_event";
CREATE TABLE "public"."dagrun_dataset_event" (
  "dag_run_id" int4 NOT NULL,
  "event_id" int4 NOT NULL
)
;

-- ----------------------------
-- Table structure for dataset
-- ----------------------------
DROP TABLE IF EXISTS "public"."dataset";
CREATE TABLE "public"."dataset" (
  "id" int4 NOT NULL DEFAULT nextval('dataset_id_seq'::regclass),
  "uri" varchar(3000) COLLATE "pg_catalog"."default" NOT NULL,
  "extra" json NOT NULL,
  "created_at" timestamptz(6) NOT NULL,
  "updated_at" timestamptz(6) NOT NULL,
  "is_orphaned" bool NOT NULL DEFAULT false
)
;

-- ----------------------------
-- Table structure for dataset_alias
-- ----------------------------
DROP TABLE IF EXISTS "public"."dataset_alias";
CREATE TABLE "public"."dataset_alias" (
  "id" int4 NOT NULL DEFAULT nextval('dataset_alias_id_seq'::regclass),
  "name" varchar(3000) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Table structure for dataset_alias_dataset
-- ----------------------------
DROP TABLE IF EXISTS "public"."dataset_alias_dataset";
CREATE TABLE "public"."dataset_alias_dataset" (
  "alias_id" int4 NOT NULL,
  "dataset_id" int4 NOT NULL
)
;

-- ----------------------------
-- Table structure for dataset_alias_dataset_event
-- ----------------------------
DROP TABLE IF EXISTS "public"."dataset_alias_dataset_event";
CREATE TABLE "public"."dataset_alias_dataset_event" (
  "alias_id" int4 NOT NULL,
  "event_id" int4 NOT NULL
)
;

-- ----------------------------
-- Table structure for dataset_dag_run_queue
-- ----------------------------
DROP TABLE IF EXISTS "public"."dataset_dag_run_queue";
CREATE TABLE "public"."dataset_dag_run_queue" (
  "dataset_id" int4 NOT NULL,
  "target_dag_id" varchar(250) COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamptz(6) NOT NULL
)
;

-- ----------------------------
-- Table structure for dataset_event
-- ----------------------------
DROP TABLE IF EXISTS "public"."dataset_event";
CREATE TABLE "public"."dataset_event" (
  "id" int4 NOT NULL DEFAULT nextval('dataset_event_id_seq'::regclass),
  "dataset_id" int4 NOT NULL,
  "extra" json NOT NULL,
  "source_task_id" varchar(250) COLLATE "pg_catalog"."default",
  "source_dag_id" varchar(250) COLLATE "pg_catalog"."default",
  "source_run_id" varchar(250) COLLATE "pg_catalog"."default",
  "source_map_index" int4 DEFAULT '-1'::integer,
  "timestamp" timestamptz(6) NOT NULL
)
;

-- ----------------------------
-- Table structure for driver_standings
-- ----------------------------
DROP TABLE IF EXISTS "public"."driver_standings";
CREATE TABLE "public"."driver_standings" (
  "driverstandingsid" int4 NOT NULL,
  "raceid" int4,
  "driverid" int4,
  "points" float8,
  "position" int4,
  "positiontext" varchar(10) COLLATE "pg_catalog"."default",
  "wins" int4
)
;

-- ----------------------------
-- Table structure for drivers
-- ----------------------------
DROP TABLE IF EXISTS "public"."drivers";
CREATE TABLE "public"."drivers" (
  "driverid" int4 NOT NULL,
  "driverref" varchar(50) COLLATE "pg_catalog"."default",
  "number" int4,
  "code" varchar(3) COLLATE "pg_catalog"."default",
  "forename" varchar(50) COLLATE "pg_catalog"."default",
  "surname" varchar(50) COLLATE "pg_catalog"."default",
  "dob" date,
  "nationality" varchar(50) COLLATE "pg_catalog"."default",
  "url" text COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for import_error
-- ----------------------------
DROP TABLE IF EXISTS "public"."import_error";
CREATE TABLE "public"."import_error" (
  "id" int4 NOT NULL DEFAULT nextval('import_error_id_seq'::regclass),
  "timestamp" timestamptz(6),
  "filename" varchar(1024) COLLATE "pg_catalog"."default",
  "stacktrace" text COLLATE "pg_catalog"."default",
  "processor_subdir" varchar(2000) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for job
-- ----------------------------
DROP TABLE IF EXISTS "public"."job";
CREATE TABLE "public"."job" (
  "id" int4 NOT NULL DEFAULT nextval('job_id_seq'::regclass),
  "dag_id" varchar(250) COLLATE "pg_catalog"."default",
  "state" varchar(20) COLLATE "pg_catalog"."default",
  "job_type" varchar(30) COLLATE "pg_catalog"."default",
  "start_date" timestamptz(6),
  "end_date" timestamptz(6),
  "latest_heartbeat" timestamptz(6),
  "executor_class" varchar(500) COLLATE "pg_catalog"."default",
  "hostname" varchar(500) COLLATE "pg_catalog"."default",
  "unixname" varchar(1000) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for lap_times
-- ----------------------------
DROP TABLE IF EXISTS "public"."lap_times";
CREATE TABLE "public"."lap_times" (
  "raceid" int4,
  "driverid" int4,
  "lap" int4,
  "position" int4,
  "time" interval(6),
  "milliseconds" int8
)
;

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS "public"."log";
CREATE TABLE "public"."log" (
  "id" int4 NOT NULL DEFAULT nextval('log_id_seq'::regclass),
  "dttm" timestamptz(6),
  "dag_id" varchar(250) COLLATE "pg_catalog"."default",
  "task_id" varchar(250) COLLATE "pg_catalog"."default",
  "map_index" int4,
  "event" varchar(60) COLLATE "pg_catalog"."default",
  "execution_date" timestamptz(6),
  "run_id" varchar(250) COLLATE "pg_catalog"."default",
  "owner" varchar(500) COLLATE "pg_catalog"."default",
  "owner_display_name" varchar(500) COLLATE "pg_catalog"."default",
  "extra" text COLLATE "pg_catalog"."default",
  "try_number" int4
)
;

-- ----------------------------
-- Table structure for log_template
-- ----------------------------
DROP TABLE IF EXISTS "public"."log_template";
CREATE TABLE "public"."log_template" (
  "id" int4 NOT NULL DEFAULT nextval('log_template_id_seq'::regclass),
  "filename" text COLLATE "pg_catalog"."default" NOT NULL,
  "elasticsearch_id" text COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamptz(6) NOT NULL
)
;

-- ----------------------------
-- Table structure for pit_stops
-- ----------------------------
DROP TABLE IF EXISTS "public"."pit_stops";
CREATE TABLE "public"."pit_stops" (
  "raceid" int4,
  "driverid" int4,
  "stop" int4,
  "lap" int4,
  "time" time(6),
  "duration" interval(6),
  "milliseconds" int4
)
;

-- ----------------------------
-- Table structure for qualifying
-- ----------------------------
DROP TABLE IF EXISTS "public"."qualifying";
CREATE TABLE "public"."qualifying" (
  "qualifyid" int4 NOT NULL,
  "raceid" int4,
  "driverid" int4,
  "constructorid" int4,
  "number" int4,
  "position" int4,
  "q1" time(6),
  "q2" time(6),
  "q3" time(6)
)
;

-- ----------------------------
-- Table structure for races
-- ----------------------------
DROP TABLE IF EXISTS "public"."races";
CREATE TABLE "public"."races" (
  "raceid" int4 NOT NULL,
  "year" int4,
  "round" int4,
  "circuitid" int4,
  "name" text COLLATE "pg_catalog"."default",
  "date" date,
  "time" time(6),
  "url" text COLLATE "pg_catalog"."default",
  "fp1_date" date,
  "fp1_time" time(6),
  "fp2_date" date,
  "fp2_time" time(6),
  "fp3_date" date,
  "fp3_time" time(6),
  "quali_date" date,
  "quali_time" time(6),
  "sprint_date" date,
  "sprint_time" time(6)
)
;

-- ----------------------------
-- Table structure for rendered_task_instance_fields
-- ----------------------------
DROP TABLE IF EXISTS "public"."rendered_task_instance_fields";
CREATE TABLE "public"."rendered_task_instance_fields" (
  "dag_id" varchar(250) COLLATE "pg_catalog"."default" NOT NULL,
  "task_id" varchar(250) COLLATE "pg_catalog"."default" NOT NULL,
  "run_id" varchar(250) COLLATE "pg_catalog"."default" NOT NULL,
  "map_index" int4 NOT NULL DEFAULT '-1'::integer,
  "rendered_fields" json NOT NULL,
  "k8s_pod_yaml" json
)
;

-- ----------------------------
-- Table structure for results
-- ----------------------------
DROP TABLE IF EXISTS "public"."results";
CREATE TABLE "public"."results" (
  "resultid" int4 NOT NULL,
  "raceid" int4,
  "driverid" int4,
  "constructorid" int4,
  "number" int4,
  "grid" int4,
  "position" int4,
  "positiontext" varchar(10) COLLATE "pg_catalog"."default",
  "positionorder" int4,
  "points" float8,
  "laps" int4,
  "time" interval(6),
  "milliseconds" int8,
  "fastestlap" int4,
  "rank" int4,
  "fastestlaptime" interval(6),
  "fastestlapspeed" float8,
  "statusid" int4
)
;

-- ----------------------------
-- Table structure for seasons
-- ----------------------------
DROP TABLE IF EXISTS "public"."seasons";
CREATE TABLE "public"."seasons" (
  "year" varchar(4) COLLATE "pg_catalog"."default" NOT NULL,
  "url" varchar(150) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for serialized_dag
-- ----------------------------
DROP TABLE IF EXISTS "public"."serialized_dag";
CREATE TABLE "public"."serialized_dag" (
  "dag_id" varchar(250) COLLATE "pg_catalog"."default" NOT NULL,
  "fileloc" varchar(2000) COLLATE "pg_catalog"."default" NOT NULL,
  "fileloc_hash" int8 NOT NULL,
  "data" json,
  "data_compressed" bytea,
  "last_updated" timestamptz(6) NOT NULL,
  "dag_hash" varchar(32) COLLATE "pg_catalog"."default" NOT NULL,
  "processor_subdir" varchar(2000) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for session
-- ----------------------------
DROP TABLE IF EXISTS "public"."session";
CREATE TABLE "public"."session" (
  "id" int4 NOT NULL DEFAULT nextval('session_id_seq'::regclass),
  "session_id" varchar(255) COLLATE "pg_catalog"."default",
  "data" bytea,
  "expiry" timestamp(6)
)
;

-- ----------------------------
-- Table structure for sla_miss
-- ----------------------------
DROP TABLE IF EXISTS "public"."sla_miss";
CREATE TABLE "public"."sla_miss" (
  "task_id" varchar(250) COLLATE "pg_catalog"."default" NOT NULL,
  "dag_id" varchar(250) COLLATE "pg_catalog"."default" NOT NULL,
  "execution_date" timestamptz(6) NOT NULL,
  "email_sent" bool,
  "timestamp" timestamptz(6),
  "description" text COLLATE "pg_catalog"."default",
  "notification_sent" bool
)
;

-- ----------------------------
-- Table structure for slot_pool
-- ----------------------------
DROP TABLE IF EXISTS "public"."slot_pool";
CREATE TABLE "public"."slot_pool" (
  "id" int4 NOT NULL DEFAULT nextval('slot_pool_id_seq'::regclass),
  "pool" varchar(256) COLLATE "pg_catalog"."default",
  "slots" int4,
  "description" text COLLATE "pg_catalog"."default",
  "include_deferred" bool NOT NULL
)
;

-- ----------------------------
-- Table structure for sprint_results
-- ----------------------------
DROP TABLE IF EXISTS "public"."sprint_results";
CREATE TABLE "public"."sprint_results" (
  "resultid" int4 NOT NULL,
  "raceid" int4,
  "driverid" int4,
  "constructorid" int4,
  "number" int4,
  "grid" int4,
  "position" int4,
  "positiontext" varchar(10) COLLATE "pg_catalog"."default",
  "positionorder" int4,
  "points" float8,
  "laps" int4,
  "time" interval(6),
  "milliseconds" int8,
  "fastestlap" int4,
  "fastestlaptime" interval(6),
  "statusid" int4
)
;

-- ----------------------------
-- Table structure for status
-- ----------------------------
DROP TABLE IF EXISTS "public"."status";
CREATE TABLE "public"."status" (
  "statusid" int4 NOT NULL,
  "status" varchar(50) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for task_fail
-- ----------------------------
DROP TABLE IF EXISTS "public"."task_fail";
CREATE TABLE "public"."task_fail" (
  "id" int4 NOT NULL DEFAULT nextval('task_fail_id_seq'::regclass),
  "task_id" varchar(250) COLLATE "pg_catalog"."default" NOT NULL,
  "dag_id" varchar(250) COLLATE "pg_catalog"."default" NOT NULL,
  "run_id" varchar(250) COLLATE "pg_catalog"."default" NOT NULL,
  "map_index" int4 NOT NULL DEFAULT '-1'::integer,
  "start_date" timestamptz(6),
  "end_date" timestamptz(6),
  "duration" int4
)
;

-- ----------------------------
-- Table structure for task_instance
-- ----------------------------
DROP TABLE IF EXISTS "public"."task_instance";
CREATE TABLE "public"."task_instance" (
  "task_id" varchar(250) COLLATE "pg_catalog"."default" NOT NULL,
  "dag_id" varchar(250) COLLATE "pg_catalog"."default" NOT NULL,
  "run_id" varchar(250) COLLATE "pg_catalog"."default" NOT NULL,
  "map_index" int4 NOT NULL DEFAULT '-1'::integer,
  "start_date" timestamptz(6),
  "end_date" timestamptz(6),
  "duration" float8,
  "state" varchar(20) COLLATE "pg_catalog"."default",
  "try_number" int4,
  "max_tries" int4 DEFAULT '-1'::integer,
  "hostname" varchar(1000) COLLATE "pg_catalog"."default",
  "unixname" varchar(1000) COLLATE "pg_catalog"."default",
  "job_id" int4,
  "pool" varchar(256) COLLATE "pg_catalog"."default" NOT NULL,
  "pool_slots" int4 NOT NULL,
  "queue" varchar(256) COLLATE "pg_catalog"."default",
  "priority_weight" int4,
  "operator" varchar(1000) COLLATE "pg_catalog"."default",
  "custom_operator_name" varchar(1000) COLLATE "pg_catalog"."default",
  "queued_dttm" timestamptz(6),
  "queued_by_job_id" int4,
  "pid" int4,
  "executor" varchar(1000) COLLATE "pg_catalog"."default",
  "executor_config" bytea,
  "updated_at" timestamptz(6),
  "rendered_map_index" varchar(250) COLLATE "pg_catalog"."default",
  "external_executor_id" varchar(250) COLLATE "pg_catalog"."default",
  "trigger_id" int4,
  "trigger_timeout" timestamp(6),
  "next_method" varchar(1000) COLLATE "pg_catalog"."default",
  "next_kwargs" json,
  "task_display_name" varchar(2000) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for task_instance_history
-- ----------------------------
DROP TABLE IF EXISTS "public"."task_instance_history";
CREATE TABLE "public"."task_instance_history" (
  "id" int4 NOT NULL DEFAULT nextval('task_instance_history_id_seq'::regclass),
  "task_id" varchar(250) COLLATE "pg_catalog"."default" NOT NULL,
  "dag_id" varchar(250) COLLATE "pg_catalog"."default" NOT NULL,
  "run_id" varchar(250) COLLATE "pg_catalog"."default" NOT NULL,
  "map_index" int4 NOT NULL DEFAULT '-1'::integer,
  "try_number" int4 NOT NULL,
  "start_date" timestamptz(6),
  "end_date" timestamptz(6),
  "duration" float8,
  "state" varchar(20) COLLATE "pg_catalog"."default",
  "max_tries" int4 DEFAULT '-1'::integer,
  "hostname" varchar(1000) COLLATE "pg_catalog"."default",
  "unixname" varchar(1000) COLLATE "pg_catalog"."default",
  "job_id" int4,
  "pool" varchar(256) COLLATE "pg_catalog"."default" NOT NULL,
  "pool_slots" int4 NOT NULL,
  "queue" varchar(256) COLLATE "pg_catalog"."default",
  "priority_weight" int4,
  "operator" varchar(1000) COLLATE "pg_catalog"."default",
  "custom_operator_name" varchar(1000) COLLATE "pg_catalog"."default",
  "queued_dttm" timestamptz(6),
  "queued_by_job_id" int4,
  "pid" int4,
  "executor" varchar(1000) COLLATE "pg_catalog"."default",
  "executor_config" bytea,
  "updated_at" timestamptz(6),
  "rendered_map_index" varchar(250) COLLATE "pg_catalog"."default",
  "external_executor_id" varchar(250) COLLATE "pg_catalog"."default",
  "trigger_id" int4,
  "trigger_timeout" timestamp(6),
  "next_method" varchar(1000) COLLATE "pg_catalog"."default",
  "next_kwargs" json,
  "task_display_name" varchar(2000) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for task_instance_note
-- ----------------------------
DROP TABLE IF EXISTS "public"."task_instance_note";
CREATE TABLE "public"."task_instance_note" (
  "user_id" int4,
  "task_id" varchar(250) COLLATE "pg_catalog"."default" NOT NULL,
  "dag_id" varchar(250) COLLATE "pg_catalog"."default" NOT NULL,
  "run_id" varchar(250) COLLATE "pg_catalog"."default" NOT NULL,
  "map_index" int4 NOT NULL,
  "content" varchar(1000) COLLATE "pg_catalog"."default",
  "created_at" timestamptz(6) NOT NULL,
  "updated_at" timestamptz(6) NOT NULL
)
;

-- ----------------------------
-- Table structure for task_map
-- ----------------------------
DROP TABLE IF EXISTS "public"."task_map";
CREATE TABLE "public"."task_map" (
  "dag_id" varchar(250) COLLATE "pg_catalog"."default" NOT NULL,
  "task_id" varchar(250) COLLATE "pg_catalog"."default" NOT NULL,
  "run_id" varchar(250) COLLATE "pg_catalog"."default" NOT NULL,
  "map_index" int4 NOT NULL,
  "length" int4 NOT NULL,
  "keys" json
)
;

-- ----------------------------
-- Table structure for task_outlet_dataset_reference
-- ----------------------------
DROP TABLE IF EXISTS "public"."task_outlet_dataset_reference";
CREATE TABLE "public"."task_outlet_dataset_reference" (
  "dataset_id" int4 NOT NULL,
  "dag_id" varchar(250) COLLATE "pg_catalog"."default" NOT NULL,
  "task_id" varchar(250) COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamptz(6) NOT NULL,
  "updated_at" timestamptz(6) NOT NULL
)
;

-- ----------------------------
-- Table structure for task_reschedule
-- ----------------------------
DROP TABLE IF EXISTS "public"."task_reschedule";
CREATE TABLE "public"."task_reschedule" (
  "id" int4 NOT NULL DEFAULT nextval('task_reschedule_id_seq'::regclass),
  "task_id" varchar(250) COLLATE "pg_catalog"."default" NOT NULL,
  "dag_id" varchar(250) COLLATE "pg_catalog"."default" NOT NULL,
  "run_id" varchar(250) COLLATE "pg_catalog"."default" NOT NULL,
  "map_index" int4 NOT NULL DEFAULT '-1'::integer,
  "try_number" int4 NOT NULL,
  "start_date" timestamptz(6) NOT NULL,
  "end_date" timestamptz(6) NOT NULL,
  "duration" int4 NOT NULL,
  "reschedule_date" timestamptz(6) NOT NULL
)
;

-- ----------------------------
-- Table structure for trigger
-- ----------------------------
DROP TABLE IF EXISTS "public"."trigger";
CREATE TABLE "public"."trigger" (
  "id" int4 NOT NULL DEFAULT nextval('trigger_id_seq'::regclass),
  "classpath" varchar(1000) COLLATE "pg_catalog"."default" NOT NULL,
  "kwargs" text COLLATE "pg_catalog"."default" NOT NULL,
  "created_date" timestamptz(6) NOT NULL,
  "triggerer_id" int4
)
;

-- ----------------------------
-- Table structure for variable
-- ----------------------------
DROP TABLE IF EXISTS "public"."variable";
CREATE TABLE "public"."variable" (
  "id" int4 NOT NULL DEFAULT nextval('variable_id_seq'::regclass),
  "key" varchar(250) COLLATE "pg_catalog"."default",
  "val" text COLLATE "pg_catalog"."default",
  "description" text COLLATE "pg_catalog"."default",
  "is_encrypted" bool
)
;

-- ----------------------------
-- Table structure for xcom
-- ----------------------------
DROP TABLE IF EXISTS "public"."xcom";
CREATE TABLE "public"."xcom" (
  "dag_run_id" int4 NOT NULL,
  "task_id" varchar(250) COLLATE "pg_catalog"."default" NOT NULL,
  "map_index" int4 NOT NULL DEFAULT '-1'::integer,
  "key" varchar(512) COLLATE "pg_catalog"."default" NOT NULL,
  "dag_id" varchar(250) COLLATE "pg_catalog"."default" NOT NULL,
  "run_id" varchar(250) COLLATE "pg_catalog"."default" NOT NULL,
  "value" bytea,
  "timestamp" timestamptz(6) NOT NULL
)
;

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ab_permission_id_seq"
OWNED BY "public"."ab_permission"."id";
SELECT setval('"public"."ab_permission_id_seq"', 5, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ab_permission_view_id_seq"
OWNED BY "public"."ab_permission_view"."id";
SELECT setval('"public"."ab_permission_view_id_seq"', 99, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ab_permission_view_role_id_seq"
OWNED BY "public"."ab_permission_view_role"."id";
SELECT setval('"public"."ab_permission_view_role_id_seq"', 224, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ab_register_user_id_seq"
OWNED BY "public"."ab_register_user"."id";
SELECT setval('"public"."ab_register_user_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ab_role_id_seq"
OWNED BY "public"."ab_role"."id";
SELECT setval('"public"."ab_role_id_seq"', 5, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ab_user_id_seq"
OWNED BY "public"."ab_user"."id";
SELECT setval('"public"."ab_user_id_seq"', 1, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ab_user_role_id_seq"
OWNED BY "public"."ab_user_role"."id";
SELECT setval('"public"."ab_user_role_id_seq"', 1, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ab_view_menu_id_seq"
OWNED BY "public"."ab_view_menu"."id";
SELECT setval('"public"."ab_view_menu_id_seq"', 55, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."callback_request_id_seq"
OWNED BY "public"."callback_request"."id";
SELECT setval('"public"."callback_request_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."connection_id_seq"
OWNED BY "public"."connection"."id";
SELECT setval('"public"."connection_id_seq"', 61, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."dag_pickle_id_seq"
OWNED BY "public"."dag_pickle"."id";
SELECT setval('"public"."dag_pickle_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."dag_run_id_seq"
OWNED BY "public"."dag_run"."id";
SELECT setval('"public"."dag_run_id_seq"', 15, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."dataset_alias_id_seq"
OWNED BY "public"."dataset_alias"."id";
SELECT setval('"public"."dataset_alias_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."dataset_event_id_seq"
OWNED BY "public"."dataset_event"."id";
SELECT setval('"public"."dataset_event_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."dataset_id_seq"
OWNED BY "public"."dataset"."id";
SELECT setval('"public"."dataset_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."import_error_id_seq"
OWNED BY "public"."import_error"."id";
SELECT setval('"public"."import_error_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."job_id_seq"
OWNED BY "public"."job"."id";
SELECT setval('"public"."job_id_seq"', 35, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."log_id_seq"
OWNED BY "public"."log"."id";
SELECT setval('"public"."log_id_seq"', 139, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."log_template_id_seq"
OWNED BY "public"."log_template"."id";
SELECT setval('"public"."log_template_id_seq"', 2, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."session_id_seq"
OWNED BY "public"."session"."id";
SELECT setval('"public"."session_id_seq"', 4, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."slot_pool_id_seq"
OWNED BY "public"."slot_pool"."id";
SELECT setval('"public"."slot_pool_id_seq"', 1, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."task_fail_id_seq"
OWNED BY "public"."task_fail"."id";
SELECT setval('"public"."task_fail_id_seq"', 30, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."task_instance_history_id_seq"
OWNED BY "public"."task_instance_history"."id";
SELECT setval('"public"."task_instance_history_id_seq"', 15, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."task_reschedule_id_seq"
OWNED BY "public"."task_reschedule"."id";
SELECT setval('"public"."task_reschedule_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."trigger_id_seq"
OWNED BY "public"."trigger"."id";
SELECT setval('"public"."trigger_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."variable_id_seq"
OWNED BY "public"."variable"."id";
SELECT setval('"public"."variable_id_seq"', 1, false);

-- ----------------------------
-- Uniques structure for table ab_permission
-- ----------------------------
ALTER TABLE "public"."ab_permission" ADD CONSTRAINT "ab_permission_name_uq" UNIQUE ("name");

-- ----------------------------
-- Primary Key structure for table ab_permission
-- ----------------------------
ALTER TABLE "public"."ab_permission" ADD CONSTRAINT "ab_permission_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Uniques structure for table ab_permission_view
-- ----------------------------
ALTER TABLE "public"."ab_permission_view" ADD CONSTRAINT "ab_permission_view_permission_id_view_menu_id_uq" UNIQUE ("permission_id", "view_menu_id");

-- ----------------------------
-- Primary Key structure for table ab_permission_view
-- ----------------------------
ALTER TABLE "public"."ab_permission_view" ADD CONSTRAINT "ab_permission_view_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Uniques structure for table ab_permission_view_role
-- ----------------------------
ALTER TABLE "public"."ab_permission_view_role" ADD CONSTRAINT "ab_permission_view_role_permission_view_id_role_id_uq" UNIQUE ("permission_view_id", "role_id");

-- ----------------------------
-- Primary Key structure for table ab_permission_view_role
-- ----------------------------
ALTER TABLE "public"."ab_permission_view_role" ADD CONSTRAINT "ab_permission_view_role_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table ab_register_user
-- ----------------------------
CREATE UNIQUE INDEX "idx_ab_register_user_username" ON "public"."ab_register_user" USING btree (
  lower(username::text) COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Uniques structure for table ab_register_user
-- ----------------------------
ALTER TABLE "public"."ab_register_user" ADD CONSTRAINT "ab_register_user_username_uq" UNIQUE ("username");

-- ----------------------------
-- Primary Key structure for table ab_register_user
-- ----------------------------
ALTER TABLE "public"."ab_register_user" ADD CONSTRAINT "ab_register_user_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Uniques structure for table ab_role
-- ----------------------------
ALTER TABLE "public"."ab_role" ADD CONSTRAINT "ab_role_name_uq" UNIQUE ("name");

-- ----------------------------
-- Primary Key structure for table ab_role
-- ----------------------------
ALTER TABLE "public"."ab_role" ADD CONSTRAINT "ab_role_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table ab_user
-- ----------------------------
CREATE UNIQUE INDEX "idx_ab_user_username" ON "public"."ab_user" USING btree (
  lower(username::text) COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Uniques structure for table ab_user
-- ----------------------------
ALTER TABLE "public"."ab_user" ADD CONSTRAINT "ab_user_username_uq" UNIQUE ("username");
ALTER TABLE "public"."ab_user" ADD CONSTRAINT "ab_user_email_uq" UNIQUE ("email");

-- ----------------------------
-- Primary Key structure for table ab_user
-- ----------------------------
ALTER TABLE "public"."ab_user" ADD CONSTRAINT "ab_user_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Uniques structure for table ab_user_role
-- ----------------------------
ALTER TABLE "public"."ab_user_role" ADD CONSTRAINT "ab_user_role_user_id_role_id_uq" UNIQUE ("user_id", "role_id");

-- ----------------------------
-- Primary Key structure for table ab_user_role
-- ----------------------------
ALTER TABLE "public"."ab_user_role" ADD CONSTRAINT "ab_user_role_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Uniques structure for table ab_view_menu
-- ----------------------------
ALTER TABLE "public"."ab_view_menu" ADD CONSTRAINT "ab_view_menu_name_uq" UNIQUE ("name");

-- ----------------------------
-- Primary Key structure for table ab_view_menu
-- ----------------------------
ALTER TABLE "public"."ab_view_menu" ADD CONSTRAINT "ab_view_menu_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table alembic_version
-- ----------------------------
ALTER TABLE "public"."alembic_version" ADD CONSTRAINT "alembic_version_pkc" PRIMARY KEY ("version_num");

-- ----------------------------
-- Primary Key structure for table callback_request
-- ----------------------------
ALTER TABLE "public"."callback_request" ADD CONSTRAINT "callback_request_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table circuits
-- ----------------------------
ALTER TABLE "public"."circuits" ADD CONSTRAINT "circuits_pkey" PRIMARY KEY ("circuitid");

-- ----------------------------
-- Uniques structure for table connection
-- ----------------------------
ALTER TABLE "public"."connection" ADD CONSTRAINT "connection_conn_id_uq" UNIQUE ("conn_id");

-- ----------------------------
-- Primary Key structure for table connection
-- ----------------------------
ALTER TABLE "public"."connection" ADD CONSTRAINT "connection_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table constructor_results
-- ----------------------------
ALTER TABLE "public"."constructor_results" ADD CONSTRAINT "constructor_results_pkey" PRIMARY KEY ("constructorresultsid");

-- ----------------------------
-- Primary Key structure for table constructor_standings
-- ----------------------------
ALTER TABLE "public"."constructor_standings" ADD CONSTRAINT "constructor_standings_pkey" PRIMARY KEY ("constructorstandingsid");

-- ----------------------------
-- Primary Key structure for table constructors
-- ----------------------------
ALTER TABLE "public"."constructors" ADD CONSTRAINT "constructors_pkey" PRIMARY KEY ("constructorid");

-- ----------------------------
-- Indexes structure for table dag
-- ----------------------------
CREATE INDEX "idx_next_dagrun_create_after" ON "public"."dag" USING btree (
  "next_dagrun_create_after" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
);
CREATE INDEX "idx_root_dag_id" ON "public"."dag" USING btree (
  "root_dag_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table dag
-- ----------------------------
ALTER TABLE "public"."dag" ADD CONSTRAINT "dag_pkey" PRIMARY KEY ("dag_id");

-- ----------------------------
-- Primary Key structure for table dag_code
-- ----------------------------
ALTER TABLE "public"."dag_code" ADD CONSTRAINT "dag_code_pkey" PRIMARY KEY ("fileloc_hash");

-- ----------------------------
-- Primary Key structure for table dag_owner_attributes
-- ----------------------------
ALTER TABLE "public"."dag_owner_attributes" ADD CONSTRAINT "dag_owner_attributes_pkey" PRIMARY KEY ("dag_id", "owner");

-- ----------------------------
-- Primary Key structure for table dag_pickle
-- ----------------------------
ALTER TABLE "public"."dag_pickle" ADD CONSTRAINT "dag_pickle_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table dag_priority_parsing_request
-- ----------------------------
ALTER TABLE "public"."dag_priority_parsing_request" ADD CONSTRAINT "dag_priority_parsing_request_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table dag_run
-- ----------------------------
CREATE INDEX "dag_id_state" ON "public"."dag_run" USING btree (
  "dag_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "state" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_dag_run_dag_id" ON "public"."dag_run" USING btree (
  "dag_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_dag_run_queued_dags" ON "public"."dag_run" USING btree (
  "state" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "dag_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE state::text = 'queued'::text;
CREATE INDEX "idx_dag_run_running_dags" ON "public"."dag_run" USING btree (
  "state" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "dag_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE state::text = 'running'::text;

-- ----------------------------
-- Uniques structure for table dag_run
-- ----------------------------
ALTER TABLE "public"."dag_run" ADD CONSTRAINT "dag_run_dag_id_execution_date_key" UNIQUE ("dag_id", "execution_date");
ALTER TABLE "public"."dag_run" ADD CONSTRAINT "dag_run_dag_id_run_id_key" UNIQUE ("dag_id", "run_id");

-- ----------------------------
-- Primary Key structure for table dag_run
-- ----------------------------
ALTER TABLE "public"."dag_run" ADD CONSTRAINT "dag_run_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table dag_run_note
-- ----------------------------
ALTER TABLE "public"."dag_run_note" ADD CONSTRAINT "dag_run_note_pkey" PRIMARY KEY ("dag_run_id");

-- ----------------------------
-- Indexes structure for table dag_schedule_dataset_alias_reference
-- ----------------------------
CREATE INDEX "idx_dag_schedule_dataset_alias_reference_dag_id" ON "public"."dag_schedule_dataset_alias_reference" USING btree (
  "dag_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table dag_schedule_dataset_alias_reference
-- ----------------------------
ALTER TABLE "public"."dag_schedule_dataset_alias_reference" ADD CONSTRAINT "dsdar_pkey" PRIMARY KEY ("alias_id", "dag_id");

-- ----------------------------
-- Indexes structure for table dag_schedule_dataset_reference
-- ----------------------------
CREATE INDEX "idx_dag_schedule_dataset_reference_dag_id" ON "public"."dag_schedule_dataset_reference" USING btree (
  "dag_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table dag_schedule_dataset_reference
-- ----------------------------
ALTER TABLE "public"."dag_schedule_dataset_reference" ADD CONSTRAINT "dsdr_pkey" PRIMARY KEY ("dataset_id", "dag_id");

-- ----------------------------
-- Indexes structure for table dag_tag
-- ----------------------------
CREATE INDEX "idx_dag_tag_dag_id" ON "public"."dag_tag" USING btree (
  "dag_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table dag_tag
-- ----------------------------
ALTER TABLE "public"."dag_tag" ADD CONSTRAINT "dag_tag_pkey" PRIMARY KEY ("name", "dag_id");

-- ----------------------------
-- Indexes structure for table dag_warning
-- ----------------------------
CREATE INDEX "idx_dag_warning_dag_id" ON "public"."dag_warning" USING btree (
  "dag_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table dag_warning
-- ----------------------------
ALTER TABLE "public"."dag_warning" ADD CONSTRAINT "dag_warning_pkey" PRIMARY KEY ("dag_id", "warning_type");

-- ----------------------------
-- Indexes structure for table dagrun_dataset_event
-- ----------------------------
CREATE INDEX "idx_dagrun_dataset_events_dag_run_id" ON "public"."dagrun_dataset_event" USING btree (
  "dag_run_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_dagrun_dataset_events_event_id" ON "public"."dagrun_dataset_event" USING btree (
  "event_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table dagrun_dataset_event
-- ----------------------------
ALTER TABLE "public"."dagrun_dataset_event" ADD CONSTRAINT "dagrun_dataset_event_pkey" PRIMARY KEY ("dag_run_id", "event_id");

-- ----------------------------
-- Indexes structure for table dataset
-- ----------------------------
CREATE UNIQUE INDEX "idx_uri_unique" ON "public"."dataset" USING btree (
  "uri" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table dataset
-- ----------------------------
ALTER TABLE "public"."dataset" ADD CONSTRAINT "dataset_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table dataset_alias
-- ----------------------------
CREATE UNIQUE INDEX "idx_name_unique" ON "public"."dataset_alias" USING btree (
  "name" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table dataset_alias
-- ----------------------------
ALTER TABLE "public"."dataset_alias" ADD CONSTRAINT "dataset_alias_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table dataset_alias_dataset
-- ----------------------------
CREATE INDEX "idx_dataset_alias_dataset_alias_dataset_id" ON "public"."dataset_alias_dataset" USING btree (
  "dataset_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_dataset_alias_dataset_alias_id" ON "public"."dataset_alias_dataset" USING btree (
  "alias_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table dataset_alias_dataset
-- ----------------------------
ALTER TABLE "public"."dataset_alias_dataset" ADD CONSTRAINT "dataset_alias_dataset_pkey" PRIMARY KEY ("alias_id", "dataset_id");

-- ----------------------------
-- Indexes structure for table dataset_alias_dataset_event
-- ----------------------------
CREATE INDEX "idx_dataset_alias_dataset_event_alias_id" ON "public"."dataset_alias_dataset_event" USING btree (
  "alias_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_dataset_alias_dataset_event_event_id" ON "public"."dataset_alias_dataset_event" USING btree (
  "event_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table dataset_alias_dataset_event
-- ----------------------------
ALTER TABLE "public"."dataset_alias_dataset_event" ADD CONSTRAINT "dataset_alias_dataset_event_pkey" PRIMARY KEY ("alias_id", "event_id");

-- ----------------------------
-- Indexes structure for table dataset_dag_run_queue
-- ----------------------------
CREATE INDEX "idx_dataset_dag_run_queue_target_dag_id" ON "public"."dataset_dag_run_queue" USING btree (
  "target_dag_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table dataset_dag_run_queue
-- ----------------------------
ALTER TABLE "public"."dataset_dag_run_queue" ADD CONSTRAINT "datasetdagrunqueue_pkey" PRIMARY KEY ("dataset_id", "target_dag_id");

-- ----------------------------
-- Indexes structure for table dataset_event
-- ----------------------------
CREATE INDEX "idx_dataset_id_timestamp" ON "public"."dataset_event" USING btree (
  "dataset_id" "pg_catalog"."int4_ops" ASC NULLS LAST,
  "timestamp" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table dataset_event
-- ----------------------------
ALTER TABLE "public"."dataset_event" ADD CONSTRAINT "dataset_event_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table driver_standings
-- ----------------------------
ALTER TABLE "public"."driver_standings" ADD CONSTRAINT "driver_standings_pkey" PRIMARY KEY ("driverstandingsid");

-- ----------------------------
-- Uniques structure for table drivers
-- ----------------------------
ALTER TABLE "public"."drivers" ADD CONSTRAINT "drivers_driverref_key" UNIQUE ("driverref");

-- ----------------------------
-- Primary Key structure for table drivers
-- ----------------------------
ALTER TABLE "public"."drivers" ADD CONSTRAINT "drivers_pkey" PRIMARY KEY ("driverid");

-- ----------------------------
-- Primary Key structure for table import_error
-- ----------------------------
ALTER TABLE "public"."import_error" ADD CONSTRAINT "import_error_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table job
-- ----------------------------
CREATE INDEX "idx_job_dag_id" ON "public"."job" USING btree (
  "dag_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_job_state_heartbeat" ON "public"."job" USING btree (
  "state" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "latest_heartbeat" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
);
CREATE INDEX "job_type_heart" ON "public"."job" USING btree (
  "job_type" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "latest_heartbeat" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table job
-- ----------------------------
ALTER TABLE "public"."job" ADD CONSTRAINT "job_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table log
-- ----------------------------
CREATE INDEX "idx_log_dag" ON "public"."log" USING btree (
  "dag_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_log_dttm" ON "public"."log" USING btree (
  "dttm" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
);
CREATE INDEX "idx_log_event" ON "public"."log" USING btree (
  "event" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_log_task_instance" ON "public"."log" USING btree (
  "dag_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "task_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "run_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "map_index" "pg_catalog"."int4_ops" ASC NULLS LAST,
  "try_number" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table log
-- ----------------------------
ALTER TABLE "public"."log" ADD CONSTRAINT "log_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table log_template
-- ----------------------------
ALTER TABLE "public"."log_template" ADD CONSTRAINT "log_template_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table qualifying
-- ----------------------------
ALTER TABLE "public"."qualifying" ADD CONSTRAINT "qualifying_pkey" PRIMARY KEY ("qualifyid");

-- ----------------------------
-- Primary Key structure for table races
-- ----------------------------
ALTER TABLE "public"."races" ADD CONSTRAINT "races_pkey" PRIMARY KEY ("raceid");

-- ----------------------------
-- Primary Key structure for table rendered_task_instance_fields
-- ----------------------------
ALTER TABLE "public"."rendered_task_instance_fields" ADD CONSTRAINT "rendered_task_instance_fields_pkey" PRIMARY KEY ("dag_id", "task_id", "run_id", "map_index");

-- ----------------------------
-- Primary Key structure for table results
-- ----------------------------
ALTER TABLE "public"."results" ADD CONSTRAINT "results_pkey" PRIMARY KEY ("resultid");

-- ----------------------------
-- Primary Key structure for table seasons
-- ----------------------------
ALTER TABLE "public"."seasons" ADD CONSTRAINT "seasons_pkey" PRIMARY KEY ("year");

-- ----------------------------
-- Indexes structure for table serialized_dag
-- ----------------------------
CREATE INDEX "idx_fileloc_hash" ON "public"."serialized_dag" USING btree (
  "fileloc_hash" "pg_catalog"."int8_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table serialized_dag
-- ----------------------------
ALTER TABLE "public"."serialized_dag" ADD CONSTRAINT "serialized_dag_pkey" PRIMARY KEY ("dag_id");

-- ----------------------------
-- Uniques structure for table session
-- ----------------------------
ALTER TABLE "public"."session" ADD CONSTRAINT "session_session_id_key" UNIQUE ("session_id");

-- ----------------------------
-- Primary Key structure for table session
-- ----------------------------
ALTER TABLE "public"."session" ADD CONSTRAINT "session_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table sla_miss
-- ----------------------------
CREATE INDEX "sm_dag" ON "public"."sla_miss" USING btree (
  "dag_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table sla_miss
-- ----------------------------
ALTER TABLE "public"."sla_miss" ADD CONSTRAINT "sla_miss_pkey" PRIMARY KEY ("task_id", "dag_id", "execution_date");

-- ----------------------------
-- Uniques structure for table slot_pool
-- ----------------------------
ALTER TABLE "public"."slot_pool" ADD CONSTRAINT "slot_pool_pool_uq" UNIQUE ("pool");

-- ----------------------------
-- Primary Key structure for table slot_pool
-- ----------------------------
ALTER TABLE "public"."slot_pool" ADD CONSTRAINT "slot_pool_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sprint_results
-- ----------------------------
ALTER TABLE "public"."sprint_results" ADD CONSTRAINT "sprint_results_pkey" PRIMARY KEY ("resultid");

-- ----------------------------
-- Primary Key structure for table status
-- ----------------------------
ALTER TABLE "public"."status" ADD CONSTRAINT "status_pkey" PRIMARY KEY ("statusid");

-- ----------------------------
-- Indexes structure for table task_fail
-- ----------------------------
CREATE INDEX "idx_task_fail_task_instance" ON "public"."task_fail" USING btree (
  "dag_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "task_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "run_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "map_index" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table task_fail
-- ----------------------------
ALTER TABLE "public"."task_fail" ADD CONSTRAINT "task_fail_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table task_instance
-- ----------------------------
CREATE INDEX "ti_dag_run" ON "public"."task_instance" USING btree (
  "dag_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "run_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "ti_dag_state" ON "public"."task_instance" USING btree (
  "dag_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "state" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "ti_job_id" ON "public"."task_instance" USING btree (
  "job_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "ti_pool" ON "public"."task_instance" USING btree (
  "pool" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "state" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "priority_weight" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "ti_state" ON "public"."task_instance" USING btree (
  "state" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "ti_state_lkp" ON "public"."task_instance" USING btree (
  "dag_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "task_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "run_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "state" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "ti_trigger_id" ON "public"."task_instance" USING btree (
  "trigger_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table task_instance
-- ----------------------------
ALTER TABLE "public"."task_instance" ADD CONSTRAINT "task_instance_pkey" PRIMARY KEY ("dag_id", "task_id", "run_id", "map_index");

-- ----------------------------
-- Uniques structure for table task_instance_history
-- ----------------------------
ALTER TABLE "public"."task_instance_history" ADD CONSTRAINT "task_instance_history_dtrt_uq" UNIQUE ("dag_id", "task_id", "run_id", "map_index", "try_number");

-- ----------------------------
-- Primary Key structure for table task_instance_history
-- ----------------------------
ALTER TABLE "public"."task_instance_history" ADD CONSTRAINT "task_instance_history_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table task_instance_note
-- ----------------------------
ALTER TABLE "public"."task_instance_note" ADD CONSTRAINT "task_instance_note_pkey" PRIMARY KEY ("task_id", "dag_id", "run_id", "map_index");

-- ----------------------------
-- Checks structure for table task_map
-- ----------------------------
ALTER TABLE "public"."task_map" ADD CONSTRAINT "ck_task_map_task_map_length_not_negative" CHECK (length >= 0);

-- ----------------------------
-- Primary Key structure for table task_map
-- ----------------------------
ALTER TABLE "public"."task_map" ADD CONSTRAINT "task_map_pkey" PRIMARY KEY ("dag_id", "task_id", "run_id", "map_index");

-- ----------------------------
-- Indexes structure for table task_outlet_dataset_reference
-- ----------------------------
CREATE INDEX "idx_task_outlet_dataset_reference_dag_id" ON "public"."task_outlet_dataset_reference" USING btree (
  "dag_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table task_outlet_dataset_reference
-- ----------------------------
ALTER TABLE "public"."task_outlet_dataset_reference" ADD CONSTRAINT "todr_pkey" PRIMARY KEY ("dataset_id", "dag_id", "task_id");

-- ----------------------------
-- Indexes structure for table task_reschedule
-- ----------------------------
CREATE INDEX "idx_task_reschedule_dag_run" ON "public"."task_reschedule" USING btree (
  "dag_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "run_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_task_reschedule_dag_task_run" ON "public"."task_reschedule" USING btree (
  "dag_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "task_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "run_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "map_index" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table task_reschedule
-- ----------------------------
ALTER TABLE "public"."task_reschedule" ADD CONSTRAINT "task_reschedule_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table trigger
-- ----------------------------
ALTER TABLE "public"."trigger" ADD CONSTRAINT "trigger_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Uniques structure for table variable
-- ----------------------------
ALTER TABLE "public"."variable" ADD CONSTRAINT "variable_key_uq" UNIQUE ("key");

-- ----------------------------
-- Primary Key structure for table variable
-- ----------------------------
ALTER TABLE "public"."variable" ADD CONSTRAINT "variable_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table xcom
-- ----------------------------
CREATE INDEX "idx_xcom_key" ON "public"."xcom" USING btree (
  "key" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_xcom_task_instance" ON "public"."xcom" USING btree (
  "dag_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "task_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "run_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "map_index" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table xcom
-- ----------------------------
ALTER TABLE "public"."xcom" ADD CONSTRAINT "xcom_pkey" PRIMARY KEY ("dag_run_id", "task_id", "map_index", "key");

-- ----------------------------
-- Foreign Keys structure for table ab_permission_view
-- ----------------------------
ALTER TABLE "public"."ab_permission_view" ADD CONSTRAINT "ab_permission_view_permission_id_fkey" FOREIGN KEY ("permission_id") REFERENCES "public"."ab_permission" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."ab_permission_view" ADD CONSTRAINT "ab_permission_view_view_menu_id_fkey" FOREIGN KEY ("view_menu_id") REFERENCES "public"."ab_view_menu" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ab_permission_view_role
-- ----------------------------
ALTER TABLE "public"."ab_permission_view_role" ADD CONSTRAINT "ab_permission_view_role_permission_view_id_fkey" FOREIGN KEY ("permission_view_id") REFERENCES "public"."ab_permission_view" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."ab_permission_view_role" ADD CONSTRAINT "ab_permission_view_role_role_id_fkey" FOREIGN KEY ("role_id") REFERENCES "public"."ab_role" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ab_user
-- ----------------------------
ALTER TABLE "public"."ab_user" ADD CONSTRAINT "ab_user_changed_by_fk_fkey" FOREIGN KEY ("changed_by_fk") REFERENCES "public"."ab_user" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."ab_user" ADD CONSTRAINT "ab_user_created_by_fk_fkey" FOREIGN KEY ("created_by_fk") REFERENCES "public"."ab_user" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ab_user_role
-- ----------------------------
ALTER TABLE "public"."ab_user_role" ADD CONSTRAINT "ab_user_role_role_id_fkey" FOREIGN KEY ("role_id") REFERENCES "public"."ab_role" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."ab_user_role" ADD CONSTRAINT "ab_user_role_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "public"."ab_user" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table constructor_results
-- ----------------------------
ALTER TABLE "public"."constructor_results" ADD CONSTRAINT "constructor_results_constructorid_fkey" FOREIGN KEY ("constructorid") REFERENCES "public"."constructors" ("constructorid") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."constructor_results" ADD CONSTRAINT "constructor_results_raceid_fkey" FOREIGN KEY ("raceid") REFERENCES "public"."races" ("raceid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table constructor_standings
-- ----------------------------
ALTER TABLE "public"."constructor_standings" ADD CONSTRAINT "constructor_standings_constructorid_fkey" FOREIGN KEY ("constructorid") REFERENCES "public"."constructors" ("constructorid") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."constructor_standings" ADD CONSTRAINT "constructor_standings_raceid_fkey" FOREIGN KEY ("raceid") REFERENCES "public"."races" ("raceid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table dag_owner_attributes
-- ----------------------------
ALTER TABLE "public"."dag_owner_attributes" ADD CONSTRAINT "dag.dag_id" FOREIGN KEY ("dag_id") REFERENCES "public"."dag" ("dag_id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table dag_run
-- ----------------------------
ALTER TABLE "public"."dag_run" ADD CONSTRAINT "task_instance_log_template_id_fkey" FOREIGN KEY ("log_template_id") REFERENCES "public"."log_template" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table dag_run_note
-- ----------------------------
ALTER TABLE "public"."dag_run_note" ADD CONSTRAINT "dag_run_note_dr_fkey" FOREIGN KEY ("dag_run_id") REFERENCES "public"."dag_run" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."dag_run_note" ADD CONSTRAINT "dag_run_note_user_fkey" FOREIGN KEY ("user_id") REFERENCES "public"."ab_user" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table dag_schedule_dataset_alias_reference
-- ----------------------------
ALTER TABLE "public"."dag_schedule_dataset_alias_reference" ADD CONSTRAINT "dsdar_dag_id_fkey" FOREIGN KEY ("dag_id") REFERENCES "public"."dag" ("dag_id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."dag_schedule_dataset_alias_reference" ADD CONSTRAINT "dsdar_dataset_alias_fkey" FOREIGN KEY ("alias_id") REFERENCES "public"."dataset_alias" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table dag_schedule_dataset_reference
-- ----------------------------
ALTER TABLE "public"."dag_schedule_dataset_reference" ADD CONSTRAINT "dsdr_dag_id_fkey" FOREIGN KEY ("dag_id") REFERENCES "public"."dag" ("dag_id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."dag_schedule_dataset_reference" ADD CONSTRAINT "dsdr_dataset_fkey" FOREIGN KEY ("dataset_id") REFERENCES "public"."dataset" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table dag_tag
-- ----------------------------
ALTER TABLE "public"."dag_tag" ADD CONSTRAINT "dag_tag_dag_id_fkey" FOREIGN KEY ("dag_id") REFERENCES "public"."dag" ("dag_id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table dag_warning
-- ----------------------------
ALTER TABLE "public"."dag_warning" ADD CONSTRAINT "dcw_dag_id_fkey" FOREIGN KEY ("dag_id") REFERENCES "public"."dag" ("dag_id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table dagrun_dataset_event
-- ----------------------------
ALTER TABLE "public"."dagrun_dataset_event" ADD CONSTRAINT "dagrun_dataset_event_dag_run_id_fkey" FOREIGN KEY ("dag_run_id") REFERENCES "public"."dag_run" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."dagrun_dataset_event" ADD CONSTRAINT "dagrun_dataset_event_event_id_fkey" FOREIGN KEY ("event_id") REFERENCES "public"."dataset_event" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table dataset_alias_dataset
-- ----------------------------
ALTER TABLE "public"."dataset_alias_dataset" ADD CONSTRAINT "dataset_alias_dataset_alias_id_fkey" FOREIGN KEY ("alias_id") REFERENCES "public"."dataset_alias" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."dataset_alias_dataset" ADD CONSTRAINT "dataset_alias_dataset_dataset_id_fkey" FOREIGN KEY ("dataset_id") REFERENCES "public"."dataset" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."dataset_alias_dataset" ADD CONSTRAINT "ds_dsa_alias_id" FOREIGN KEY ("alias_id") REFERENCES "public"."dataset_alias" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."dataset_alias_dataset" ADD CONSTRAINT "ds_dsa_dataset_id" FOREIGN KEY ("dataset_id") REFERENCES "public"."dataset" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table dataset_alias_dataset_event
-- ----------------------------
ALTER TABLE "public"."dataset_alias_dataset_event" ADD CONSTRAINT "dataset_alias_dataset_event_alias_id_fkey" FOREIGN KEY ("alias_id") REFERENCES "public"."dataset_alias" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."dataset_alias_dataset_event" ADD CONSTRAINT "dataset_alias_dataset_event_event_id_fkey" FOREIGN KEY ("event_id") REFERENCES "public"."dataset_event" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."dataset_alias_dataset_event" ADD CONSTRAINT "dss_de_alias_id" FOREIGN KEY ("alias_id") REFERENCES "public"."dataset_alias" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."dataset_alias_dataset_event" ADD CONSTRAINT "dss_de_event_id" FOREIGN KEY ("event_id") REFERENCES "public"."dataset_event" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table dataset_dag_run_queue
-- ----------------------------
ALTER TABLE "public"."dataset_dag_run_queue" ADD CONSTRAINT "ddrq_dag_fkey" FOREIGN KEY ("target_dag_id") REFERENCES "public"."dag" ("dag_id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."dataset_dag_run_queue" ADD CONSTRAINT "ddrq_dataset_fkey" FOREIGN KEY ("dataset_id") REFERENCES "public"."dataset" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table driver_standings
-- ----------------------------
ALTER TABLE "public"."driver_standings" ADD CONSTRAINT "driver_standings_driverid_fkey" FOREIGN KEY ("driverid") REFERENCES "public"."drivers" ("driverid") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."driver_standings" ADD CONSTRAINT "driver_standings_raceid_fkey" FOREIGN KEY ("raceid") REFERENCES "public"."races" ("raceid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table lap_times
-- ----------------------------
ALTER TABLE "public"."lap_times" ADD CONSTRAINT "lap_times_driverid_fkey" FOREIGN KEY ("driverid") REFERENCES "public"."drivers" ("driverid") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."lap_times" ADD CONSTRAINT "lap_times_raceid_fkey" FOREIGN KEY ("raceid") REFERENCES "public"."races" ("raceid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table pit_stops
-- ----------------------------
ALTER TABLE "public"."pit_stops" ADD CONSTRAINT "pit_stops_driverid_fkey" FOREIGN KEY ("driverid") REFERENCES "public"."drivers" ("driverid") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."pit_stops" ADD CONSTRAINT "pit_stops_raceid_fkey" FOREIGN KEY ("raceid") REFERENCES "public"."races" ("raceid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table qualifying
-- ----------------------------
ALTER TABLE "public"."qualifying" ADD CONSTRAINT "qualifying_constructorid_fkey" FOREIGN KEY ("constructorid") REFERENCES "public"."constructors" ("constructorid") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."qualifying" ADD CONSTRAINT "qualifying_driverid_fkey" FOREIGN KEY ("driverid") REFERENCES "public"."drivers" ("driverid") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."qualifying" ADD CONSTRAINT "qualifying_raceid_fkey" FOREIGN KEY ("raceid") REFERENCES "public"."races" ("raceid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table races
-- ----------------------------
ALTER TABLE "public"."races" ADD CONSTRAINT "races_circuitid_fkey" FOREIGN KEY ("circuitid") REFERENCES "public"."circuits" ("circuitid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table rendered_task_instance_fields
-- ----------------------------
ALTER TABLE "public"."rendered_task_instance_fields" ADD CONSTRAINT "rtif_ti_fkey" FOREIGN KEY ("dag_id", "task_id", "run_id", "map_index") REFERENCES "public"."task_instance" ("dag_id", "task_id", "run_id", "map_index") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table results
-- ----------------------------
ALTER TABLE "public"."results" ADD CONSTRAINT "results_constructorid_fkey" FOREIGN KEY ("constructorid") REFERENCES "public"."constructors" ("constructorid") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."results" ADD CONSTRAINT "results_driverid_fkey" FOREIGN KEY ("driverid") REFERENCES "public"."drivers" ("driverid") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."results" ADD CONSTRAINT "results_raceid_fkey" FOREIGN KEY ("raceid") REFERENCES "public"."races" ("raceid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table sprint_results
-- ----------------------------
ALTER TABLE "public"."sprint_results" ADD CONSTRAINT "sprint_results_constructorid_fkey" FOREIGN KEY ("constructorid") REFERENCES "public"."constructors" ("constructorid") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."sprint_results" ADD CONSTRAINT "sprint_results_driverid_fkey" FOREIGN KEY ("driverid") REFERENCES "public"."drivers" ("driverid") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."sprint_results" ADD CONSTRAINT "sprint_results_raceid_fkey" FOREIGN KEY ("raceid") REFERENCES "public"."races" ("raceid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table task_fail
-- ----------------------------
ALTER TABLE "public"."task_fail" ADD CONSTRAINT "task_fail_ti_fkey" FOREIGN KEY ("dag_id", "task_id", "run_id", "map_index") REFERENCES "public"."task_instance" ("dag_id", "task_id", "run_id", "map_index") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table task_instance
-- ----------------------------
ALTER TABLE "public"."task_instance" ADD CONSTRAINT "task_instance_dag_run_fkey" FOREIGN KEY ("dag_id", "run_id") REFERENCES "public"."dag_run" ("dag_id", "run_id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."task_instance" ADD CONSTRAINT "task_instance_trigger_id_fkey" FOREIGN KEY ("trigger_id") REFERENCES "public"."trigger" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table task_instance_history
-- ----------------------------
ALTER TABLE "public"."task_instance_history" ADD CONSTRAINT "task_instance_history_ti_fkey" FOREIGN KEY ("dag_id", "task_id", "run_id", "map_index") REFERENCES "public"."task_instance" ("dag_id", "task_id", "run_id", "map_index") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table task_instance_note
-- ----------------------------
ALTER TABLE "public"."task_instance_note" ADD CONSTRAINT "task_instance_note_ti_fkey" FOREIGN KEY ("dag_id", "task_id", "run_id", "map_index") REFERENCES "public"."task_instance" ("dag_id", "task_id", "run_id", "map_index") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."task_instance_note" ADD CONSTRAINT "task_instance_note_user_fkey" FOREIGN KEY ("user_id") REFERENCES "public"."ab_user" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table task_map
-- ----------------------------
ALTER TABLE "public"."task_map" ADD CONSTRAINT "task_map_task_instance_fkey" FOREIGN KEY ("dag_id", "task_id", "run_id", "map_index") REFERENCES "public"."task_instance" ("dag_id", "task_id", "run_id", "map_index") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table task_outlet_dataset_reference
-- ----------------------------
ALTER TABLE "public"."task_outlet_dataset_reference" ADD CONSTRAINT "todr_dag_id_fkey" FOREIGN KEY ("dag_id") REFERENCES "public"."dag" ("dag_id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."task_outlet_dataset_reference" ADD CONSTRAINT "todr_dataset_fkey" FOREIGN KEY ("dataset_id") REFERENCES "public"."dataset" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table task_reschedule
-- ----------------------------
ALTER TABLE "public"."task_reschedule" ADD CONSTRAINT "task_reschedule_dr_fkey" FOREIGN KEY ("dag_id", "run_id") REFERENCES "public"."dag_run" ("dag_id", "run_id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."task_reschedule" ADD CONSTRAINT "task_reschedule_ti_fkey" FOREIGN KEY ("dag_id", "task_id", "run_id", "map_index") REFERENCES "public"."task_instance" ("dag_id", "task_id", "run_id", "map_index") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table xcom
-- ----------------------------
ALTER TABLE "public"."xcom" ADD CONSTRAINT "xcom_task_instance_fkey" FOREIGN KEY ("dag_id", "task_id", "run_id", "map_index") REFERENCES "public"."task_instance" ("dag_id", "task_id", "run_id", "map_index") ON DELETE CASCADE ON UPDATE NO ACTION;
