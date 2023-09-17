Class {
	#name : #BbParagraphView,
	#superclass : #CpView,
	#category : #'CodeParadise-BlogBuilder-View'
}

{ #category : #'web resources' }
BbParagraphView class >> style [

	<webResource: #css>

	^'*, *:before, *:after {
		-moz-box-sizing: border-box;
		-webkit-box-sizing: border-box;
		box-sizing: border-box;
	}
	#container {
		margin-top: 1em;
	}
	#header {
		font-size: 1.2em;
		margin-bottom: 6px;
	}
	::slotted([slot="header"]) {
		display: inline-block;
	}
	::slotted([slot="header"])::after {
		display: block;
		content: " ";
		width: 150%;
		height: 2px;
		background-color: rgba(0, 0, 0, .1);
		background: radial-gradient(circle at left, #ccc, #fff);
	}'
]

{ #category : #'web resources' }
BbParagraphView class >> template [

	<webResource: #html>

	^ '<div id="container">
		<header id="header"><slot name="header"></slot></header>
		<div id="content"><slot name="content"></slot></div>
	</div>'
]

{ #category : #rendering }
BbParagraphView >> renderHeader: aString [

	aString
		ifNotNil: [ self replaceAllChildrenWith: aString asHtmlElement atSlotNamed: #header ]
		ifNil: [ self removeChildrenAtSlotNamed: #header ]
]
