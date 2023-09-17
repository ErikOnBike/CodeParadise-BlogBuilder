Class {
	#name : #BbReferenceContentView,
	#superclass : #CpView,
	#category : #'CodeParadise-BlogBuilder-View'
}

{ #category : #'web resources' }
BbReferenceContentView class >> style [

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
BbReferenceContentView class >> template [

	<webResource: #html>

	^ '<div id="container"><span>[</span><slot></slot><span>]</span></div>'
]

{ #category : #rendering }
BbReferenceContentView >> renderName: aString [

	| anchor |

	anchor := (CpHtmlElement newWithTag: #a)
		attributeAt: #href put: '#ref-', aString ;
		appendChild: aString asHtmlElement ;
		yourself.

	self replaceAllChildrenWith: anchor atSlotNamed: nil
]
