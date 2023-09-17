Class {
	#name : #BbContentsItemPresenter,
	#superclass : #CpPresenter,
	#category : #'CodeParadise-BlogBuilder-Presenter'
}

{ #category : #rendering }
BbContentsItemPresenter >> renderView [

	| page |

	page := self model.

	self view
		renderTitle: page title ;
		renderCreatedTimestamp: page createdTimestampString ;
		renderLastUpdatedTimestamp: page lastUpdatedTimestampString
]
