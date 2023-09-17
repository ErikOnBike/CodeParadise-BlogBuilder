Class {
	#name : #BbPageView,
	#superclass : #CpView,
	#category : #'CodeParadise-BlogBuilder-View'
}

{ #category : #'web resources' }
BbPageView class >> style [

	<webResource: #css>

	^'*, *:before, *:after {
		-moz-box-sizing: border-box;
		-webkit-box-sizing: border-box;
		box-sizing: border-box;
	}
	:host(:not(.show)) {
		display: none;
	}
	#container {
		display: flex;
		flex-direction: column;
		height: 100%;
		overflow-y: scroll;
		overscroll-behavior-y: contain;
		-webkit-overflow-scrolling: touch;
		/*scrollbar-width: none;*/
	}
/*
	#container::-webkit-scrollbar {
		-webkit-appearance: none;
		width: 0;
		height: 0;
	}
*/
	#header {
		font-size: 2em;
		text-align: center;
		margin-top: 12px;
		margin-bottom: 24px;
	}
	#body {
		flex-grow: 1;
		display: flex;
		flex-direction: column;
		justify-content: space-between;
		margin-left: auto;
		margin-right: auto;
		width: 70%;
		min-width: 20em;
	}
	#sections {
		flex-grow: 1;
	}
	#references header {
		display: none;
	}
	:host(.has-references) #references header {
		display: inline-block;
		margin-top: 20px;
		margin-bottom: 6px;
		font-size: 1.3em;
	}
	:host(.has-references) #references header::before {
		display: block;
		content: " ";
		width: 20em;
		height: 2px;
		margin-bottom: 6px;
		background-color: rgba(0, 0, 0, .1);
		background: radial-gradient(circle at left, #333, #fff);
	}
	#footer {
		font-size: .8em;
		margin-top: 6px;
		margin-bottom: 6px;
		text-align: center;
	}
	#footer ::slotted(*)::before {
		content: " ";
	}
	:host(.new) .updated {
		display: none;
	}'
]

{ #category : #'web resources' }
BbPageView class >> template [

	<webResource: #html>

	^ '<div id="container">
		<header id="header"><slot name="title"></slot></header>
		<div id="body">
			<div id="sections"><slot name="sections"></slot></div>
			<div id="references">
				<header>References</header>
				<slot name="references"></slot>
			</div>
		</div>
		<footer id="footer">
			<span>Created:</span><slot name="created-timestamp"></slot>
			<span class="updated">Updated:</span><slot name="last-updated-timestamp"></slot>
		</footer>
	</div>'
]

{ #category : #rendering }
BbPageView >> appendChild: childElement atSlotNamed: nameString [

	super appendChild: childElement atSlotNamed: nameString.

	self updateReferenceVisibility
]

{ #category : #rendering }
BbPageView >> hideLastUpdatedTimestamp [

	self addClass: #new
]

{ #category : #rendering }
BbPageView >> removeChild: childElement [

	super removeChild: childElement.

	self updateReferenceVisibility
]

{ #category : #rendering }
BbPageView >> renderCreatedTimestamp: aString [

	self replaceAllChildrenWith: aString asHtmlElement atSlotNamed: #'created-timestamp'
]

{ #category : #rendering }
BbPageView >> renderLastUpdatedTimestamp: aString [

	aString
		ifNotNil: [
			self replaceAllChildrenWith: aString asHtmlElement atSlotNamed: #'last-updated-timestamp'.
			self showLastUpdatedTimestamp ]
		ifNil: [ self hideLastUpdatedTimestamp ]
]

{ #category : #rendering }
BbPageView >> renderTitle: aString [

	self replaceAllChildrenWith: aString asHtmlElement atSlotNamed: #title
]

{ #category : #actions }
BbPageView >> show [

	"Show the receiver as active page (and hiding all others).

	Implementation:
	Set or remove the class 'show' on all pages (only the one equal to
	the receiver will actually set it, all others will get it removed)."

	(CpHtmlElement documentBody allDescendantsMatching: self class asCssSelector) do: [ :each |
		each classed: #show if: each = self ]
]

{ #category : #rendering }
BbPageView >> showLastUpdatedTimestamp [

	self removeClass: #new
]

{ #category : #rendering }
BbPageView >> updateReferenceVisibility [

	(self childrenAtSlotNamed: #references)
		ifNotEmpty: [ self addClass: #'has-references' ]
		ifEmpty: [ self removeClass: #'has-references' ]
]
