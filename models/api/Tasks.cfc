/**
 * I model the Meilisearch Tasks API
 *
 * @link https://docs.meilisearch.com/reference/api/tasks.html
 */
component accessors="true" extends="BaseRequest" {

	/**
	 * Get all tasks
	 *
	 * @link https://docs.meilisearch.com/reference/api/tasks.html#get-all-tasks
	 */
	public function list(
		numeric limit,
		string from,
		string status,
		string type,
		string indexUid
	){
		return handleResponse(
			MeilisearchClient
				.setQueryParams( buildArgs( arguments ) )
				.get( "/tasks" )
		);
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
	 * Get task by index
	 *
	 * @link https://docs.meilisearch.com/reference/api/tasks.html#get-task-by-index
	 */
	public function getByIndex( required string index, required string task_uid ){
		return handleResponse(
			MeilisearchClient.get( "/indexes/#arguments.index#/tasks/#arguments.task_uid#" )
		);
	}

	/**
	 * Wait for completion of a given (asynchronous) task.
	 *
	 * @url https://docs.meilisearch.com/reference/api/overview.html#asynchronous-operations
	 * 
	 * @task_uid the unique ID of the task to wait for. 
	 * @wait_time_ms How long to wait (in milliseconds) between task polls. Defaults to 500 milliseconds.
	 */
	public struct function pollTaskCompletion( required string task_uid, numeric wait_time_ms = 500 ){
		var taskComplete = false;
		while( !taskComplete ){
			sleep( 500 );
			var result = this.get( arguments.task_uid );
			taskComplete = arrayContains( [ "succeeded", "failed" ], result.status );
		}
		return result;
	}


	// /**
	//  * Asynchronously wait for task completion... i.e. thread a callback to run on task completion.
	//  * 
	//  * TODO: implement.
	//  *
	//  * @task_uid 
	//  * @callback 
	//  * @wait_time_ms 
	//  */
	// public void function onTaskCompletion( required string task_uid, required callback, numeric wait_time_ms = 500 ){
	// 	var taskResult = pollTaskCompletion( arguments.task_uid, arguments.wait_time_ms );
	// 	callback( taskResult );
	// }

}
