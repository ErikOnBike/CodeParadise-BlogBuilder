Class {
	#name : #BbPage,
	#superclass : #CpModel,
	#instVars : [
		'title',
		'sections',
		'createdTimestamp',
		'lastUpdatedTimestamp',
		'id'
	],
	#category : #'CodeParadise-BlogBuilder-Model'
}

{ #category : #'instance creation' }
BbPage class >> title: aString [

	^ self basicNew
		initializeWithTitle: aString ;
		yourself
]

{ #category : #accessing }
BbPage >> addSection: aSection [

	sections add: aSection.

	self valueChanged.

	^ aSection
]

{ #category : #accessing }
BbPage >> createdTimestamp [

	^ createdTimestamp
]

{ #category : #accessing }
BbPage >> createdTimestamp: aDateAndTime [

	createdTimestamp := aDateAndTime
]

{ #category : #accessing }
BbPage >> createdTimestampString [

	^ createdTimestamp asStringYMDHM
]

{ #category : #initialization }
BbPage >> initialize [

	super initialize.

	"Set instance variables. Only lastUpdateTimestamp remains nil until an update is added."
	sections := OrderedCollection new.
	createdTimestamp := DateAndTime now
]

{ #category : #initialization }
BbPage >> initializeWithTitle: aString [

	self initialize.

	title := aString
]

{ #category : #accessing }
BbPage >> lastUpdatedTimestamp [

	^ lastUpdatedTimestamp
]

{ #category : #accessing }
BbPage >> lastUpdatedTimestamp: aDateAndTime [

	lastUpdatedTimestamp := aDateAndTime.

	self valueChanged
]

{ #category : #accessing }
BbPage >> lastUpdatedTimestampString [

	^ lastUpdatedTimestamp ifNotNil: [ lastUpdatedTimestamp asStringYMDHM ]
]

{ #category : #accessing }
BbPage >> references [

	^ sections flatCollect: [ :each | each references ]
]

{ #category : #accessing }
BbPage >> sections [

	^ sections
]

{ #category : #accessing }
BbPage >> title [

	^ title
]
