package com.google.buscador.venta.bean;

import lombok.Data;

@Data
public class ClienteBean {

	private int cod_cliente;
	private String nom_cliente;
	private String ape_cliente;
	private int dni_cliente;
	private String fec_nac_cliente;
	private TipoBean tipo;
	
}
