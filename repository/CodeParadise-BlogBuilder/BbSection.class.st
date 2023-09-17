Class {
	#name : #BbSection,
	#superclass : #CpModel,
	#instVars : [
		'header',
		'paragraphs'
	],
	#category : #'CodeParadise-BlogBuilder-Model'
}

{ #category : #'instance creation' }
BbSection class >> header: aString [

	^ self basicNew
		initializeWithHeader: aString ;
		yourself
]

{ #category : #accessing }
BbSection >> addParagraph: aParagraph [

	paragraphs add: aParagraph.

	self valueChanged.

	^ aParagraph
]

{ #category : #accessing }
BbSection >> header [

	^ header
]

{ #category : #initialization }
BbSection >> initialize [

	super initialize.

	paragraphs := OrderedCollection new
]

{ #category : #initialization }
BbSection >> initializeWithHeader: aString [

	self initialize.

	header := aString
]

{ #category : #accessing }
BbSection >> paragraphs [

	^ paragraphs
]

{ #category : #presenter }
BbSection >> preferredPresenterClass [

	^ BbSectionPresenter
]

{ #category : #accessing }
BbSection >> references [

	^ paragraphs flatCollect: [ :each | each references ]
]
