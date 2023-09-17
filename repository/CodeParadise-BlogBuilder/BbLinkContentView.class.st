Class {
	#name : #BbLinkContentView,
	#superclass : #CpView,
	#category : #'CodeParadise-BlogBuilder-View'
}

{ #category : #'web resources' }
BbLinkContentView class >> style [

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
BbLinkContentView class >> template [

	<webResource: #html>

	^ '<div id="container"><slot></slot><svg style="display: inline-block; width: 1em; height: 1em; margin-bottom: -0.125em;" viewbox="0 0 48 48"><path d="M36 24c-1.2 0-2 0.8-2 2v12c0 1.2-0.8 2-2 2h-22c-1.2 0-2-0.8-2-2v-22c0-1.2 0.8-2 2-2h12c1.2 0 2-0.8 2-2s-0.8-2-2-2h-12c-3.4 0-6 2.6-6 6v22c0 3.4 2.6 6 6 6h22c3.4 0 6-2.6 6-6v-12c0-1.2-0.8-2-2-2z"></path><path d="M43.8 5.2c-0.2-0.4-0.6-0.8-1-1-0.2-0.2-0.6-0.2-0.8-0.2h-12c-1.2 0-2 0.8-2 2s0.8 2 2 2h7.2l-18.6 18.6c-0.8 0.8-0.8 2 0 2.8 0.4 0.4 0.8 0.6 1.4 0.6s1-0.2 1.4-0.6l18.6-18.6v7.2c0 1.2 0.8 2 2 2s2-0.8 2-2v-12c0-0.2 0-0.6-0.2-0.8z"></path></svg></div>'
]

{ #category : #rendering }
BbLinkContentView >> renderText: textString url: urlString [

	| anchor |

	anchor := (CpHtmlElement newWithTag: #a)
		attributeAt: #href put: urlString ;
		attributeAt: #target put: '_blank' ;
		attributeAt: #rel put: 'noopener' ;
		attributeAt: #referrerpolicy put: 'no-referrer-when-downgrade' ;
		appendChild: textString asHtmlElement ;
		yourself.

	self replaceAllChildrenWith: anchor atSlotNamed: nil
]
