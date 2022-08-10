/**
 * I model the Meilisearch Documents API
 *
 * @link https://docs.meilisearch.com/reference/api/documents.html
 */
component accessors="true" extends="BaseRequest" {

	/**
	 * Get one document
	 *
	 * @link https://docs.meilisearch.com/reference/api/documents.html#get-one-document
	 */
	public HyperResponse function getDocument( required string index, required string document_id ){
		return HyperClient.get( "/indexes/#arguments.index#/documents/#document_id#" );
	}

	/**
	 * Get documents
	 *
	 * @link https://docs.meilisearch.com/reference/api/documents.html#get-documents
	 */
	public HyperResponse function getDocuments( required string index, struct params = {} ){
		return HyperClient.setQueryParams( arguments.params ).get( "/indexes/#arguments.index#/documents" );
	}

	/**
	 * Add or replace documents
	 *
	 * @link https://docs.meilisearch.com/reference/api/documents.html#add-or-replace-documents
	 */
	public HyperResponse function addDocuments(
		required string index,
		required array documents,
		struct params = {}
	){
		return HyperClient
			.setQueryParams( arguments.params )
			.setBody( arguments.documents )
			.asJson()
			.post( "/indexes/#arguments.index#/documents" );
	}

	/**
	 * Add or update documents
	 *
	 * @link https://docs.meilisearch.com/reference/api/documents.html#add-or-update-documents
	 */
	public HyperResponse function updateDocuments(
		required string index,
		required array documents,
		struct params = {}
	){
		return HyperClient
			.setQueryParams( arguments.params )
			.setBody( arguments.documents )
			.asJson()
			.put( "/indexes/#arguments.index#/documents" );
	}

	/**
	 * Delete all documents
	 *
	 * @link https://docs.meilisearch.com/reference/api/documents.html#add-or-update-documents
	 */
	public HyperResponse function deleteAllDocuments( required string index ){
		return HyperClient.delete( "/indexes/#arguments.index#/documents" );
	}

	/**
	 * Delete one document
	 *
	 * @link https://docs.meilisearch.com/reference/api/documents.html#delete-one-document
	 */
	public HyperResponse function deleteDocument( required string index, required string document_id ){
		return HyperClient.delete( "/indexes/#arguments.index#/documents/#arguments.document_id#" );
	}

	/**
	 * Delete documents by batch
	 *
	 * @link https://docs.meilisearch.com/reference/api/documents.html#delete-documents-by-batch
	 */
	public HyperResponse function deleteDocuments( required string index, required array document_ids ){
		return HyperClient
			.setBody( arguments.document_ids )
			.asJson()
			.post( "/indexes/#arguments.index#/documents/delete-batch" );
	}

}
