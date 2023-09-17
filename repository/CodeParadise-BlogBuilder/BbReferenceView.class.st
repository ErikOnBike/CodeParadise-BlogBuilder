Class {
	#name : #BbReferenceView,
	#superclass : #CpView,
	#category : #'CodeParadise-BlogBuilder-View'
}

{ #category : #'web resources' }
BbReferenceView class >> style [

	<webResource: #css>

	^'*, *:before, *:after {
		-moz-box-sizing: border-box;
		-webkit-box-sizing: border-box;
		box-sizing: border-box;
	}
	#container {
		margin-bottom: 12px;
	}
	#description {
		margin-left: 3em;
	}'
]

{ #category : #'web resources' }
BbReferenceView class >> template [

	<webResource: #html>

	^ '<div id="container">
		<div id="name"><span>[</span><slot name="name"></slot><span>]</span></div>
		<div id="description"><slot name="description"></slot></div>
	</div>'
]

{ #category : #rendering }
BbReferenceView >> renderName: aString [

	| anchor |

	anchor := (CpHtmlElement newWithTag: #a)
		attributeAt: #id put: 'ref-', aString ;
		appendChild: aString asHtmlElement ;
		yourself.

	self replaceAllChildrenWith: anchor atSlotNamed: #name
]
