Class {
	#name : #BbLinkContent,
	#superclass : #BbContent,
	#instVars : [
		'text',
		'url'
	],
	#category : #'CodeParadise-BlogBuilder-Model'
}

{ #category : #'instance creation' }
BbLinkContent class >> text: textString url: urlString [

	^ self basicNew
		initializeWithText: textString url: urlString ;
		yourself
]

{ #category : #initialization }
BbLinkContent >> initializeWithText: textString url: urlString [

	self initialize.

	text := textString.
	url := urlString
]

{ #category : #presenter }
BbLinkContent >> preferredPresenterClass [

	^ BbLinkContentPresenter
]

{ #category : #accessing }
BbLinkContent >> text [

	^ text
]

{ #category : #accessing }
BbLinkContent >> url [

	^ url
]
