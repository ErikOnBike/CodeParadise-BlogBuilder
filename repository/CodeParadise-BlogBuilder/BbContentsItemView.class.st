Class {
	#name : #BbContentsItemView,
	#superclass : #CpView,
	#instVars : [
		'linkedPage'
	],
	#category : #'CodeParadise-BlogBuilder-View'
}

{ #category : #'web resources' }
BbContentsItemView class >> style [

	<webResource: #css>

	^'*, *:before, *:after {
		-moz-box-sizing: border-box;
		-webkit-box-sizing: border-box;
		box-sizing: border-box;
	}
	#container {
		padding: 6px;
		margin-bottom: 10px;
	}
	#container:hover {
		background-color: var(--color-hover);
		cursor: pointer;
	}
	#title {
		font-size: 1.2em;
	}
	#timestamps {
		font-size: .6em;
		color: #999;
	}
	#timestamps ::slotted(*)::before {
		content: " ";
	}
	:host(.new) .updated {
		display: none;
	}'
]

{ #category : #'web resources' }
BbContentsItemView class >> template [

	<webResource: #html>

	^ '<div id="container">
		<div id="title"><slot name="title"></slot></div>
		<div id="timestamps">
			<span>Created:</span><slot name="created-timestamp"></slot>
			<span class="updated">Updated:</span><slot name="last-updated-timestamp"></slot>
		</div>
	</div>'
]

{ #category : #'event handling' }
BbContentsItemView >> handleContentsItemSelected [

	linkedPage show
]

{ #category : #rendering }
BbContentsItemView >> hideLastUpdatedTimestamp [

	self addClass: #new
]

{ #category : #initialization }
BbContentsItemView >> initialize [

	super initialize.

	self when: CpClickEvent basicPrimary send: #handleContentsItemSelected to: self
]

{ #category : #accessing }
BbContentsItemView >> linkToPage: aPageElement [

	linkedPage := aPageElement
]

{ #category : #rendering }
BbContentsItemView >> renderCreatedTimestamp: aString [

	self replaceAllChildrenWith: aString asHtmlElement atSlotNamed: #'created-timestamp'
]

{ #category : #rendering }
BbContentsItemView >> renderLastUpdatedTimestamp: aString [

	aString
		ifNotNil: [
			self replaceAllChildrenWith: aString asHtmlElement atSlotNamed: #'last-updated-timestamp'.
			self showLastUpdatedTimestamp ]
		ifNil: [ self hideLastUpdatedTimestamp ]
]

{ #category : #rendering }
BbContentsItemView >> renderTitle: aString [

	self replaceAllChildrenWith: aString asHtmlElement atSlotNamed: #title
]

{ #category : #rendering }
BbContentsItemView >> showLastUpdatedTimestamp [

	self removeClass: #new
]
