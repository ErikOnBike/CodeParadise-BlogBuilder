Class {
	#name : #BbSectionView,
	#superclass : #CpView,
	#category : #'CodeParadise-BlogBuilder-View'
}

{ #category : #'web resources' }
BbSectionView class >> style [

	<webResource: #css>

	^'*, *:before, *:after {
		-moz-box-sizing: border-box;
		-webkit-box-sizing: border-box;
		box-sizing: border-box;
	}
	#header {
		font-size: 1.5em;
		margin-bottom: 20px;
	}
	::slotted([slot="header"]) {
		display: inline-block;
	}
	::slotted([slot="header"])::after {
		display: block;
		content: " ";
		width: 150%;
		height: 2px;
		margin-top: 3px;
		background-color: rgba(0, 0, 0, .1);
		background: radial-gradient(circle at left, #333, #fff);
	}'
]

{ #category : #'web resources' }
BbSectionView class >> template [

	<webResource: #html>

	^ '<div id="container">
		<header id="header"><slot name="header"></slot></header>
		<div id="paragraphs"><slot name="paragraphs"></slot></div>
	</div>'
]

{ #category : #rendering }
BbSectionView >> renderHeader: aString [

	self replaceAllChildrenWith: aString asHtmlElement atSlotNamed: #header
]
