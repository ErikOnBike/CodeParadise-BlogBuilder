Class {
	#name : #BbBlogView,
	#superclass : #CpView,
	#category : #'CodeParadise-BlogBuilder-View'
}

{ #category : #'web resources' }
BbBlogView class >> globalStyle [

	<webResource: #css>

	^ ':root {
		--color-hover: rgba(0, 0, 255, .1);
	}
	html, body {
		height: 100%;
		margin: 0;
		padding: 0;
		overscroll-behavior-x: none;
	}
	body {
		font-family: "Open Sans", Tahoma, Geneva, sans-serif;
	}'
]

{ #category : #'web resources' }
BbBlogView class >> style [

	<webResource: #css>

	^'*, *:before, *:after {
		-moz-box-sizing: border-box;
		-webkit-box-sizing: border-box;
		box-sizing: border-box;
	}
	#container {
		display: flex;
		flex-direction: column;
		height: 100%;
		overflow: hidden;
		background-color: inherit;
	}
	#header {
		margin-top: 10px;
		font-size: 2em;
		text-align: center;
	}
	#header::after {
		position: relative;
		content: " ";
		display: block;
		left: 20%;
		width: 60%;
		height: 2px;
		margin-top: 14px;
		margin-bottom: 3px;
		background-color: rgba(0, 0, 0, .1);
		background: radial-gradient(circle at center, #ccc, #fff);
	}
	#body {
		flex-grow: 1;
		display: flex;
		flex-direction: row;
		overflow: hidden;
	}
	#pages {
		flex-grow: 1;
		overflow: hidden;
	}
	#contents {
		flex-shrink: 0;
		position: relative;
		width: 20em;
		padding-left: 14px;
		padding-right: 14px;
	}
	#contents::before {
		position: absolute;
		content: " ";
		display: block;
		top: 0;
		left: 0;
		width: 2px;
		height: 60%;
		margin-left: 3px;
		margin-right: 3px;
		background-color: rgba(0, 0, 0, .1);
		background: radial-gradient(circle at top, #333, #fff);
	}
	#contents-items {
		display: flex;
		flex-direction: column-reverse;
		/*
			Since column-reverse puts items at the bottom, adjust height accordingly.
			Using "justify-content: flex-end;" does not work, because it prevents
			scrolling. And "safe flex-end" will default back to "flex-start" if over-
			flowing, which also is not what we want.
			Other solution would have been adding extra containers or providing the
			items in the "correct" order in the first place. I like the ability to
			order it through CSS and therefore leave this in.
		*/
		min-height: min-content;
		max-height: 100%;
		overflow-y: scroll;
		overscroll-behavior-y: contain;
		-webkit-overflow-scrolling: touch;
	}
	#footer {
		margin-bottom: 2px;
		margin-right: 10px;
		text-align: right;
	}
	#footer::before {
		position: relative;
		content: " ";
		display: block;
		left: 20%;
		width: 60%;
		height: 2px;
		margin-bottom: 3px;
		margin-top: 3px;
		background-color: rgba(0, 0, 0, .1);
		background: radial-gradient(circle at center, #ccc, #fff);
	}'
]

{ #category : #'web resources' }
BbBlogView class >> template [

	<webResource: #html>

	^ '<div id="container">
		<header id="header"><slot name="title"></slot></header>
		<div id="body">
			<div id="pages"><slot name="pages"></slot></div>
			<div id="contents">
				<div id="contents-items"><slot name="contents-items"></slot></div>
			</div>
		</div>
		<footer id="footer">This blog is built with <a href="https://github.com/ErikOnBike/CodeParadise-BlogBuilder" target="_blank">BlogBuilder</a></footer>
	</div>'
]

{ #category : #'adding/removing' }
BbBlogView >> appendChild: childElement atSlotNamed: nameString [

	super appendChild: childElement atSlotNamed: nameString.

	nameString = #pages
		ifTrue: [ self linkNewPage: childElement ].
	nameString = #'contents-items'
		ifTrue: [ self linkNewContentsItem: childElement ]
]

{ #category : #'adding/removing' }
BbBlogView >> linkNewContentsItem: childElement [

	"The specified contents-item is newly added, link it to the matching
	page if it already exists (otherwise they will be linked as soon as the
	page is added)."

	| contentsItemIndex pages |

	contentsItemIndex := (self childrenAtSlotNamed: #'contents-items') size.
	pages := self childrenAtSlotNamed: #pages.

	"Check if contents-item exists already"
	contentsItemIndex > pages size
		ifTrue: [ ^ self ].

	childElement linkToPage: (pages at: contentsItemIndex)
]

{ #category : #'adding/removing' }
BbBlogView >> linkNewPage: childElement [

	"The specified page is newly added, link it to the matching
	contents-item if it already exists (otherwise they will be linked as
	soon as the contents-item is added)."

	| pageIndex contentsItems |

	pageIndex := (self childrenAtSlotNamed: #pages) size.
	contentsItems := self childrenAtSlotNamed: #'contents-items'.

	"Check if contents-item exists already"
	pageIndex > contentsItems size
		ifTrue: [ ^ self ].

	(contentsItems at: pageIndex)
		linkToPage: childElement
]

{ #category : #rendering }
BbBlogView >> renderTitle: aString [

	CpHtmlElement document
		propertyAt: #title put: aString.

	self replaceAllChildrenWith: aString asHtmlElement atSlotNamed: #title
]
