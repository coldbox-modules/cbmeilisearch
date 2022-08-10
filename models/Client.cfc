component accessors="true"{

    property name="Documents" inject delegate;
    property name="Indexes" inject delegate;
    property name="Tasks" inject delegate;
    property name="Keys" inject delegate;
    property name="Settings" inject delegate;
    property name="Version" inject delegate;
    property name="Dumps" inject delegate;
    property name="Stats" inject delegate;

    /**
     * Set the index UID to operate on.
     * 
     * @link https://docs.meilisearch.com/learn/core_concepts/indexes.html#index-uid
     */
    property name="index" type="string" default="";

    public component function init(){
        return this;
    }
}