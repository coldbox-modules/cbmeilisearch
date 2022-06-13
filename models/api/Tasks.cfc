/**
 * I model the Meilisearch Tasks API
 *
 * @link https://docs.meilisearch.com/reference/api/tasks.html
 */
component accessors="true" extends="../BaseRequest" {

	/**
	 * Get all tasks
	 *
	 * @link https://docs.meilisearch.com/reference/api/tasks.html#get-all-tasks
	 */
	public function list(){
		return handleResponse( MeilisearchClient.get( "/tasks" ) );
	}

	/**
	 * Get one task
	 *
	 * @link https://docs.meilisearch.com/reference/api/tasks.html#get-task
	 */
	public function get( required string task_uid ){
		return handleResponse( MeilisearchClient.get( "/tasks/#arguments.task_uid#" ) );
	}

	/**
	 * Get all tasks by index
	 *
	 * @link https://docs.meilisearch.com/reference/api/tasks.html#get-all-tasks-by-index
	 */
	public function getAllByIndex( required string index_uid ){
		return handleResponse( MeilisearchClient.get( "/indexes/#arguments.index_uid#/tasks" ) );
	}

	/**
	 * Get task by index
	 *
	 * @link https://docs.meilisearch.com/reference/api/tasks.html#get-task-by-index
	 */
	public function getByIndex( required string index_uid, required string task_uid ){
		return handleResponse(
			MeilisearchClient.get( "/indexes/#arguments.index_uid#/tasks/#arguments.task_uid#" )
		);
	}

}
