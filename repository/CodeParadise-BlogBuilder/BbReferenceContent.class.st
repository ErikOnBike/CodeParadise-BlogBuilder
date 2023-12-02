Class {
	#name : #BbReferenceContent,
	#superclass : #BbContent,
	#instVars : [
		'name',
		'description'
	],
	#category : #'CodeParadise-BlogBuilder-Model'
}

{ #category : #'instance creation' }
BbReferenceContent class >> name: aString description: aContent [

	^ self basicNew
		initializeWithName: aString description: aContent ;
		yourself
]

{ #category : #accessing }
BbReferenceContent >> description [

	^ description
]

{ #category : #accessing }
BbReferenceContent >> description: aContent [

	description := aContent.

	self valueChanged
]

{ #category : #initialization }
BbReferenceContent >> initializeWithName: aString description: aContent [

	self initialize.

	name := aString.
	description := aContent
]

{ #category : #testing }
BbReferenceContent >> isReference [

	^ true
]

{ #category : #accessing }
BbReferenceContent >> name [

	^ name
]
