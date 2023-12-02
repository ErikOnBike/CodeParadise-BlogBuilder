Class {
	#name : #BbParagraph,
	#superclass : #CpModel,
	#instVars : [
		'header',
		'content'
	],
	#category : #'CodeParadise-BlogBuilder-Model'
}

{ #category : #'instance creation' }
BbParagraph class >> header: aString [

	^ self basicNew
		initializeWithHeader: aString ;
		yourself
]

{ #category : #accessing }
BbParagraph >> addContent: aContent [

	content add: aContent.

	self valueChanged.

	^ aContent
]

{ #category : #accessing }
BbParagraph >> content [

	^ content
]

{ #category : #accessing }
BbParagraph >> header [

	^ header
]

{ #category : #initialization }
BbParagraph >> initialize [

	super initialize.

	content := OrderedCollection new
]

{ #category : #initialization }
BbParagraph >> initializeWithHeader: aString [

	self initialize.

	header := aString
]

{ #category : #accessing }
BbParagraph >> references [

	^ content select: [ :each | each isReference ]
]
