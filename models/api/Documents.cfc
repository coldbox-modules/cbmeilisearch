/**
 * I model the Meilisearch Documents API
 * 
 * @link https://docs.meilisearch.com/reference/api/documents.html
 */
component accessors="true" extends="../BaseRequest" {

	/**
	 * Get one document
	 * 
	 * @link https://docs.meilisearch.com/reference/api/documents.html#get-one-document
	 */
	public function get( required string index_uid, required string document_id ){
		return handleResponse(
			MeilisearchClient.get( "/indexes/#arguments.index_uid#/documents/#document_id#" )
		);
	}

	/**
	 * Get documents
	 * 
	 * @link https://docs.meilisearch.com/reference/api/documents.html#get-documents
	 */
	public function list( 
		required string index_uid,
		numeric offset,
		numeric limit,
		string attributesToRetrieve
	){
		return handleResponse(
			MeilisearchClient
                .setQueryParams( buildArgs( arguments, [ "offset", "limit", "attributesToRetrieve" ] ) )
                .get( "/indexes/#arguments.index_uid#/documents" )
		);
	}

	/**
	 * Add or replace documents
	 * 
	 * @link https://docs.meilisearch.com/reference/api/documents.html#add-or-replace-documents
	 */
	public function addOrReplace( required string index_uid, required array documents, string primaryKey ){
		return handleResponse(
			MeilisearchClient
                .setQueryParams( buildArgs( arguments, [ "primaryKey" ] ) )
                .setBody( arguments.documents )
				.withHeaders( { "Content-Type" : "application/json" } )
                .post( "/indexes/#arguments.index_uid#/documents" )
		);
	}

	/**
	 * Add or update documents
	 * 
	 * @link https://docs.meilisearch.com/reference/api/documents.html#add-or-update-documents
	 */
	public function addOrUpdate( required string index_uid, required array documents, string primaryKey ){
		return handleResponse(
			MeilisearchClient
                .setQueryParams( buildArgs( arguments, [ "primaryKey" ] ) )
                .setBody( arguments.documents )
				.withHeaders( { "Content-Type" : "application/json" } )
                .put( "/indexes/#arguments.index_uid#/documents" )
		);
	}

	/**
	 * Delete all documents
	 * 
	 * @link https://docs.meilisearch.com/reference/api/documents.html#add-or-update-documents
	 */
	public function deleteAll( required string index_uid ){
		return handleResponse(
			MeilisearchClient.delete( "/indexes/#arguments.index_uid#/documents" )
		);
	}

	/**
	 * Delete one document
	 * 
	 * @link https://docs.meilisearch.com/reference/api/documents.html#delete-one-document
	 */
	public function deleteOne( required string index_uid, required string document_id ){
		return handleResponse(
			MeilisearchClient.delete( "/indexes/#arguments.index_uid#/documents/#arguments.document_id#" )
		);
	}

	/**
	 * Delete documents by batch
	 * 
	 * @link https://docs.meilisearch.com/reference/api/documents.html#delete-documents-by-batch
	 */
	public function deleteBatch( required string index_uid, required array document_ids ){
		return handleResponse(
			MeilisearchClient
                .setBody( arguments.document_ids )
                .withHeaders( { "Content-Type" : "application/json" } )
                .post( "/indexes/#arguments.index_uid#/documents/delete-batch" )
		);
	}
}