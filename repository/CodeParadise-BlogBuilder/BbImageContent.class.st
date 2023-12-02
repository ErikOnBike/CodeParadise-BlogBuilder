Class {
	#name : #BbImageContent,
	#superclass : #BbContent,
	#instVars : [
		'src',
		'title',
		'description',
		'width',
		'height'
	],
	#category : #'CodeParadise-BlogBuilder-Model'
}

{ #category : #accessing }
BbImageContent class >> src: aString [

	^ self src: aString title: nil
]

{ #category : #accessing }
BbImageContent class >> src: srcString title: titleString [

	^ self basicNew
		initializeWithSrc: srcString title: titleString ;
		yourself
]

{ #category : #accessing }
BbImageContent >> description [

	^ description
]

{ #category : #accessing }
BbImageContent >> description: aContent [

	description := aContent.

	self valueChanged
]

{ #category : #accessing }
BbImageContent >> height [

	^ height
]

{ #category : #accessing }
BbImageContent >> height: aString [

	height := aString.

	self valueChanged
]

{ #category : #initialization }
BbImageContent >> initializeWithSrc: srcString title: titleString [

	self initialize.

	src := srcString.
	title := titleString
]

{ #category : #accessing }
BbImageContent >> src [

	^ src
]

{ #category : #accessing }
BbImageContent >> title [

	^ title
]

{ #category : #accessing }
BbImageContent >> title: aString [

	title := aString.

	self valueChanged
]

{ #category : #accessing }
BbImageContent >> width [

	^ width
]

{ #category : #accessing }
BbImageContent >> width: aString [

	width := aString.

	self valueChanged
]
