Class {
	#name : #BbCodeContentView,
	#superclass : #CpView,
	#category : #'CodeParadise-BlogBuilder-View'
}

{ #category : #'web resources' }
BbCodeContentView class >> style [

	<webResource: #css>

	^'*, *:before, *:after {
		-moz-box-sizing: border-box;
		-webkit-box-sizing: border-box;
		box-sizing: border-box;
	}
	#container {
		border: solid 1px #ccc;
		margin: 12px 0 20px 40px;
	}
	#header {
		padding: 3px 0 3px 6px;
		background-color: #ccc;
		background: linear-gradient(to right, #ccc, #eee);
	}
	::slotted([slot="language"]:not(:empty))::before {
		content: " [";
	}
	::slotted([slot="language"]:not(:empty))::after {
		content: "]";
	}
	#code {
		font-family: "Courier New";
		font-size: 1rem;
		white-space: pre;
		overflow-x: scroll;
		scrollbar-width: none;
		overscroll-behavior-x: contain;
		-webkit-overflow-scrolling: touch;
	}
	#code::-webkit-scrollbar {
		-webkit-appearance: none;
		width: 0;
		height: 0;
	}
	:host {
		counter-reset: linenumber;
	}
	::slotted([slot="code"])::before {
		position: sticky;
		display: inline-block;
		counter-increment: linenumber;
		content: counter(linenumber) " ";
		left: 0;
		width: 2em;
		margin-right: 6px;
		border-right: solid 1px #999;
		text-align: right;
		background-color: #fff;
	}
	::slotted([slot="code"]) {
		position: relative;
		display: block;
	}
	::slotted([slot="code"]:hover) {
		background-color: var(--color-hover);
	}'
]

{ #category : #'web resources' }
BbCodeContentView class >> template [

	<webResource: #html>

	^ '<div id="container">
		<header id="header"><span>Code</span><slot name="language"></slot></header>
		<div id="code"><slot name="code"></slot></div>
	</div>'
]

{ #category : #rendering }
BbCodeContentView >> renderCode: codeString language: languageString [

	| codeLines |

	codeLines := codeString findTokens: Character lf.

	self removeChildrenAtSlotNamed: #code.
	codeLines do: [ :each |
		self appendChild: each asHtmlElement atSlotNamed: #code ].

	languageString
		ifNotNil: [ self replaceAllChildrenWith: languageString asHtmlElement atSlotNamed: #language ]
		ifNil: [ self removeChildrenAtSlotNamed: #language ]
]
