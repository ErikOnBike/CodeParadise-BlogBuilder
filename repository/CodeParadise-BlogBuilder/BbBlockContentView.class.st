Class {
	#name : #BbBlockContentView,
	#superclass : #CpView,
	#category : #'CodeParadise-BlogBuilder-View'
}

{ #category : #'web resources' }
BbBlockContentView class >> style [

	<webResource: #css>

	^'*, *:before, *:after {
		-moz-box-sizing: border-box;
		-webkit-box-sizing: border-box;
		box-sizing: border-box;
	}
	:host,
	#container {
		display: inline;
	}'
]

{ #category : #'web resources' }
BbBlockContentView class >> template [

	<webResource: #html>

	^ '<div id="container"><slot></slot></div>'
]
