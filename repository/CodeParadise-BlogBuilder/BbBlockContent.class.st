Class {
	#name : #BbBlockContent,
	#superclass : #BbContent,
	#instVars : [
		'contentItems'
	],
	#category : #'CodeParadise-BlogBuilder-Model'
}

{ #category : #adding }
BbBlockContent >> addContent: aContent [

	contentItems add: aContent.

	self valueChanged.

	^ aContent
]

{ #category : #initialization }
BbBlockContent >> initialize [

	super initialize.

	contentItems := OrderedCollection new
]
