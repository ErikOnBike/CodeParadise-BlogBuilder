Class {
	#name : #BbCodeContent,
	#superclass : #BbContent,
	#instVars : [
		'code',
		'language'
	],
	#category : #'CodeParadise-BlogBuilder-Model'
}

{ #category : #'instance creation' }
BbCodeContent class >> code: aString [

	^ self code: aString language: nil
]

{ #category : #'instance creation' }
BbCodeContent class >> code: codeString language: languageString [

	^ self basicNew
		initializeWithCode: codeString language: languageString ;
		yourself
]

{ #category : #accessing }
BbCodeContent >> code [

	^ code
]

{ #category : #accessing }
BbCodeContent >> code: aString [

	code := aString.

	self valueChanged
]

{ #category : #initialization }
BbCodeContent >> initializeWithCode: codeString language: languageString [

	self initialize.

	code := codeString.
	language := languageString
]

{ #category : #accessing }
BbCodeContent >> language [

	^ language
]

{ #category : #accessing }
BbCodeContent >> language: aString [

	language := aString.

	self valueChanged
]
