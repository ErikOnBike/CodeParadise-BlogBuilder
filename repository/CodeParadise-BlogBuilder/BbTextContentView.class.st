Class {
	#name : #BbTextContentView,
	#superclass : #CpView,
	#category : #'CodeParadise-BlogBuilder-View'
}

{ #category : #'web resources' }
BbTextContentView class >> style [

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
BbTextContentView class >> template [

	<webResource: #html>

	^ '<div id="container"><slot></slot></div>'
]

{ #category : #rendering }
BbTextContentView >> renderText: aString [

	self replaceAllChildrenWith: aString asHtmlElement atSlotNamed: nil
]
