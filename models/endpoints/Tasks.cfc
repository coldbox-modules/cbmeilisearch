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
	public HyperResponse function getAllTasks( struct params = {} ){
		return HyperClient.setQueryParams( arguments.params ).get( "/tasks" );
	}

	/**
	 * Get one task
	 *
	 * @link https://docs.meilisearch.com/reference/api/tasks.html#get-task
	 */
	public HyperResponse function getTask( required string task_uid ){
		return HyperClient.get( "/tasks/#arguments.task_uid#" );
	}

	/**
	 * Wait for completion of a given (asynchronous) task.
	 *
	 * @url          https://docs.meilisearch.com/reference/api/overview.html#asynchronous-operations
	 * @task_uid     the unique ID of the task to wait for.
	 * @wait_time_ms How long to wait (in milliseconds) between task polls. Defaults to 500 milliseconds.
	 */
	public struct function waitForTask( required string task_uid, numeric wait_time_ms = 500 ){
		var taskComplete = false;
		while ( !taskComplete ) {
			sleep( 500 );
			var response = this.getTask( arguments.task_uid ).json();
			taskComplete = arrayContains( [ "succeeded", "failed" ], response.status );
		}
		return response;
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
	// 	var taskResult = waitFor( arguments.task_uid, arguments.wait_time_ms );
	// 	callback( taskResult );
	// }

}
