Class {
	#name : #BbContent,
	#superclass : #CpModel,
	#category : #'CodeParadise-BlogBuilder-Model'
}

{ #category : #testing }
BbContent class >> isAbstract [

	^ self == BbContent
]

{ #category : #testing }
BbContent >> isReference [

	^ false
]
