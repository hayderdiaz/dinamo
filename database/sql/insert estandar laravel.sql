--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.11
-- Dumped by pg_dump version 9.6.11

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.migrations VALUES (1, '2018_11_26_152615_create_password_resets_table', 1);
INSERT INTO public.migrations VALUES (2, '2018_11_26_152615_create_tab_almacenes_table', 1);
INSERT INTO public.migrations VALUES (3, '2018_11_26_152615_create_tab_apartados_det_table', 1);
INSERT INTO public.migrations VALUES (4, '2018_11_26_152615_create_tab_apartados_enc_table', 1);
INSERT INTO public.migrations VALUES (5, '2018_11_26_152615_create_tab_avances_table', 1);
INSERT INTO public.migrations VALUES (6, '2018_11_26_152615_create_tab_bon_det_table', 1);
INSERT INTO public.migrations VALUES (7, '2018_11_26_152615_create_tab_bon_enc_table', 1);
INSERT INTO public.migrations VALUES (8, '2018_11_26_152615_create_tab_caja_table', 1);
INSERT INTO public.migrations VALUES (9, '2018_11_26_152615_create_tab_can_apartados_table', 1);
INSERT INTO public.migrations VALUES (10, '2018_11_26_152615_create_tab_ciudades_table', 1);
INSERT INTO public.migrations VALUES (11, '2018_11_26_152615_create_tab_clientes_table', 1);
INSERT INTO public.migrations VALUES (12, '2018_11_26_152615_create_tab_colores_table', 1);
INSERT INTO public.migrations VALUES (13, '2018_11_26_152615_create_tab_com_emp_table', 1);
INSERT INTO public.migrations VALUES (14, '2018_11_26_152615_create_tab_comisiones_table', 1);
INSERT INTO public.migrations VALUES (15, '2018_11_26_152615_create_tab_consignaciones_table', 1);
INSERT INTO public.migrations VALUES (16, '2018_11_26_152615_create_tab_cont_invent_table', 1);
INSERT INTO public.migrations VALUES (17, '2018_11_26_152615_create_tab_departamentos_table', 1);
INSERT INTO public.migrations VALUES (18, '2018_11_26_152615_create_tab_devol_det_table', 1);
INSERT INTO public.migrations VALUES (19, '2018_11_26_152615_create_tab_devol_enc_table', 1);
INSERT INTO public.migrations VALUES (20, '2018_11_26_152615_create_tab_empleados_table', 1);
INSERT INTO public.migrations VALUES (21, '2018_11_26_152615_create_tab_facturas_det_table', 1);
INSERT INTO public.migrations VALUES (22, '2018_11_26_152615_create_tab_facturas_enc_table', 1);
INSERT INTO public.migrations VALUES (23, '2018_11_26_152615_create_tab_for_pago_table', 1);
INSERT INTO public.migrations VALUES (24, '2018_11_26_152615_create_tab_graficos_table', 1);
INSERT INTO public.migrations VALUES (25, '2018_11_26_152615_create_tab_guardados_table', 1);
INSERT INTO public.migrations VALUES (26, '2018_11_26_152615_create_tab_info_factura_table', 1);
INSERT INTO public.migrations VALUES (27, '2018_11_26_152615_create_tab_ing_egr_table', 1);
INSERT INTO public.migrations VALUES (28, '2018_11_26_152615_create_tab_insumos_table', 1);
INSERT INTO public.migrations VALUES (29, '2018_11_26_152615_create_tab_inventario_table', 1);
INSERT INTO public.migrations VALUES (30, '2018_11_26_152615_create_tab_kardex_table', 1);
INSERT INTO public.migrations VALUES (31, '2018_11_26_152615_create_tab_labrados_table', 1);
INSERT INTO public.migrations VALUES (32, '2018_11_26_152615_create_tab_lineas_insumo_table', 1);
INSERT INTO public.migrations VALUES (33, '2018_11_26_152615_create_tab_marcas_table', 1);
INSERT INTO public.migrations VALUES (34, '2018_11_26_152615_create_tab_med_pago_table', 1);
INSERT INTO public.migrations VALUES (35, '2018_11_26_152615_create_tab_medidas_table', 1);
INSERT INTO public.migrations VALUES (36, '2018_11_26_152615_create_tab_menu_table', 1);
INSERT INTO public.migrations VALUES (37, '2018_11_26_152615_create_tab_parametros_table', 1);
INSERT INTO public.migrations VALUES (38, '2018_11_26_152615_create_tab_pedidos_det_table', 1);
INSERT INTO public.migrations VALUES (39, '2018_11_26_152615_create_tab_pedidos_enc_table', 1);
INSERT INTO public.migrations VALUES (40, '2018_11_26_152615_create_tab_perfil_menu_table', 1);
INSERT INTO public.migrations VALUES (41, '2018_11_26_152615_create_tab_perfil_submenu_table', 1);
INSERT INTO public.migrations VALUES (42, '2018_11_26_152615_create_tab_perfiles_table', 1);
INSERT INTO public.migrations VALUES (43, '2018_11_26_152615_create_tab_proveedores_table', 1);
INSERT INTO public.migrations VALUES (44, '2018_11_26_152615_create_tab_recaudos_det_table', 1);
INSERT INTO public.migrations VALUES (45, '2018_11_26_152615_create_tab_recaudos_enc_table', 1);
INSERT INTO public.migrations VALUES (46, '2018_11_26_152615_create_tab_reportes_table', 1);
INSERT INTO public.migrations VALUES (47, '2018_11_26_152615_create_tab_serv_clientes_table', 1);
INSERT INTO public.migrations VALUES (48, '2018_11_26_152615_create_tab_submenu_table', 1);
INSERT INTO public.migrations VALUES (49, '2018_11_26_152615_create_tab_tipos_productos_table', 1);
INSERT INTO public.migrations VALUES (50, '2018_11_26_152615_create_users_table', 1);
INSERT INTO public.migrations VALUES (51, '2018_11_26_152616_add_foreign_keys_to_tab_apartados_det_table', 1);
INSERT INTO public.migrations VALUES (52, '2018_11_26_152616_add_foreign_keys_to_tab_apartados_enc_table', 1);
INSERT INTO public.migrations VALUES (53, '2018_11_26_152616_add_foreign_keys_to_tab_avances_table', 1);
INSERT INTO public.migrations VALUES (54, '2018_11_26_152616_add_foreign_keys_to_tab_bon_det_table', 1);
INSERT INTO public.migrations VALUES (55, '2018_11_26_152616_add_foreign_keys_to_tab_can_apartados_table', 1);
INSERT INTO public.migrations VALUES (56, '2018_11_26_152616_add_foreign_keys_to_tab_ciudades_table', 1);
INSERT INTO public.migrations VALUES (57, '2018_11_26_152616_add_foreign_keys_to_tab_clientes_table', 1);
INSERT INTO public.migrations VALUES (58, '2018_11_26_152616_add_foreign_keys_to_tab_com_emp_table', 1);
INSERT INTO public.migrations VALUES (59, '2018_11_26_152616_add_foreign_keys_to_tab_consignaciones_table', 1);
INSERT INTO public.migrations VALUES (60, '2018_11_26_152616_add_foreign_keys_to_tab_cont_invent_table', 1);
INSERT INTO public.migrations VALUES (61, '2018_11_26_152616_add_foreign_keys_to_tab_devol_det_table', 1);
INSERT INTO public.migrations VALUES (62, '2018_11_26_152616_add_foreign_keys_to_tab_facturas_det_table', 1);
INSERT INTO public.migrations VALUES (63, '2018_11_26_152616_add_foreign_keys_to_tab_facturas_enc_table', 1);
INSERT INTO public.migrations VALUES (64, '2018_11_26_152616_add_foreign_keys_to_tab_guardados_table', 1);
INSERT INTO public.migrations VALUES (65, '2018_11_26_152616_add_foreign_keys_to_tab_info_factura_table', 1);
INSERT INTO public.migrations VALUES (66, '2018_11_26_152616_add_foreign_keys_to_tab_insumos_table', 1);
INSERT INTO public.migrations VALUES (67, '2018_11_26_152616_add_foreign_keys_to_tab_inventario_table', 1);
INSERT INTO public.migrations VALUES (68, '2018_11_26_152616_add_foreign_keys_to_tab_kardex_table', 1);
INSERT INTO public.migrations VALUES (69, '2018_11_26_152616_add_foreign_keys_to_tab_med_pago_table', 1);
INSERT INTO public.migrations VALUES (70, '2018_11_26_152616_add_foreign_keys_to_tab_parametros_table', 1);
INSERT INTO public.migrations VALUES (71, '2018_11_26_152616_add_foreign_keys_to_tab_pedidos_det_table', 1);
INSERT INTO public.migrations VALUES (72, '2018_11_26_152616_add_foreign_keys_to_tab_pedidos_enc_table', 1);
INSERT INTO public.migrations VALUES (73, '2018_11_26_152616_add_foreign_keys_to_tab_perfil_menu_table', 1);
INSERT INTO public.migrations VALUES (74, '2018_11_26_152616_add_foreign_keys_to_tab_perfil_submenu_table', 1);
INSERT INTO public.migrations VALUES (75, '2018_11_26_152616_add_foreign_keys_to_tab_proveedores_table', 1);
INSERT INTO public.migrations VALUES (76, '2018_11_26_152616_add_foreign_keys_to_tab_recaudos_det_table', 1);
INSERT INTO public.migrations VALUES (77, '2018_11_26_152616_add_foreign_keys_to_tab_recaudos_enc_table', 1);
INSERT INTO public.migrations VALUES (78, '2018_11_26_152616_add_foreign_keys_to_tab_serv_clientes_table', 1);
INSERT INTO public.migrations VALUES (79, '2018_11_26_152616_add_foreign_keys_to_users_table', 1);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.migrations_id_seq', 79, true);




INSERT INTO public.tab_perfiles VALUES (1, 'Admin');




INSERT INTO public.users VALUES (1, '1098712428', 1, 'Hayder', 'hayder.diaz18@gmail.com', true, NULL, '$2y$10$qV7pCTL1aoPulo0Kl1BaH.rMzdToy9ZeW4RqTtUhoX5I0KJDXhrF2', 'Hayder', NULL, '2018-11-26 17:34:26', '2018-11-26 17:34:26');


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 1, true);


--
-- PostgreSQL database dump complete
--

