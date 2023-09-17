Class {
	#name : #BbPagePresenter,
	#superclass : #CpPresenter,
	#category : #'CodeParadise-BlogBuilder-Presenter'
}

{ #category : #rendering }
BbPagePresenter >> renderView [

	| page |

	page := self model.

	self view
		renderTitle: page title ;
		renderCreatedTimestamp: page createdTimestampString ;
		renderLastUpdatedTimestamp: page lastUpdatedTimestampString.

	self renderAllChildViewsForModels: page sections atSlotNamed: #sections.
	self renderAllChildViewsForModels: page references usingPresenter: BbReferencePresenter atSlotNamed: #references
]
