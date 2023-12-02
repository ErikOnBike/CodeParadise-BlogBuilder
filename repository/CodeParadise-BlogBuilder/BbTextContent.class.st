Class {
	#name : #BbTextContent,
	#superclass : #BbContent,
	#instVars : [
		'text'
	],
	#category : #'CodeParadise-BlogBuilder-Model'
}

{ #category : #'instance creation' }
BbTextContent class >> text: aString [

	^ self basicNew
		initializeWithText: aString ;
		yourself
]

{ #category : #initialization }
BbTextContent >> initializeWithText: aString [

	self initialize.

	text := aString
]

{ #category : #accessing }
BbTextContent >> text [

	^ text
]
