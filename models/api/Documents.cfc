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
	public function get( required string index, required string document_id ){
		return handleResponse( MeilisearchClient.get( "/indexes/#arguments.index#/documents/#document_id#" ) );
	}

	/**
	 * Get documents
	 *
	 * @link https://docs.meilisearch.com/reference/api/documents.html#get-documents
	 */
	public function list(
		required string index,
		numeric offset,
		numeric limit,
		string attributesToRetrieve
	){
		return handleResponse(
			MeilisearchClient
				.setQueryParams( buildArgs( arguments, [ "offset", "limit", "attributesToRetrieve" ] ) )
				.get( "/indexes/#arguments.index#/documents" )
		);
	}

	/**
	 * Add or replace documents
	 *
	 * @link https://docs.meilisearch.com/reference/api/documents.html#add-or-replace-documents
	 */
	public function addOrReplace(
		required string index,
		required array documents,
		string primaryKey
	){
		return handleResponse(
			MeilisearchClient
				.setQueryParams( buildArgs( arguments, [ "primaryKey" ] ) )
				.setBody( arguments.documents )
				.asJson()
				.post( "/indexes/#arguments.index#/documents" )
		);
	}

	/**
	 * Add or update documents
	 *
	 * @link https://docs.meilisearch.com/reference/api/documents.html#add-or-update-documents
	 */
	public function addOrUpdate(
		required string index,
		required array documents,
		string primaryKey
	){
		return handleResponse(
			MeilisearchClient
				.setQueryParams( buildArgs( arguments, [ "primaryKey" ] ) )
				.setBody( arguments.documents )
				.asJson()
				.put( "/indexes/#arguments.index#/documents" )
		);
	}

	/**
	 * Delete all documents
	 *
	 * @link https://docs.meilisearch.com/reference/api/documents.html#add-or-update-documents
	 */
	public function deleteAll( required string index ){
		return handleResponse( MeilisearchClient.delete( "/indexes/#arguments.index#/documents" ) );
	}

	/**
	 * Delete one document
	 *
	 * @link https://docs.meilisearch.com/reference/api/documents.html#delete-one-document
	 */
	public function deleteOne( required string index, required string document_id ){
		return handleResponse(
			MeilisearchClient.delete( "/indexes/#arguments.index#/documents/#arguments.document_id#" )
		);
	}

	/**
	 * Delete documents by batch
	 *
	 * @link https://docs.meilisearch.com/reference/api/documents.html#delete-documents-by-batch
	 */
	public function deleteBatch( required string index, required array document_ids ){
		return handleResponse(
			MeilisearchClient
				.setBody( arguments.document_ids )
				.asJson()
				.post( "/indexes/#arguments.index#/documents/delete-batch" )
		);
	}

}
