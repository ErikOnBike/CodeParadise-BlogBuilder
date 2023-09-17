Class {
	#name : #BbBlogPresenter,
	#superclass : #CpPresenter,
	#category : #'CodeParadise-BlogBuilder-Presenter'
}

{ #category : #rendering }
BbBlogPresenter >> renderView [

	| blog pages |

	blog := self model.

	self view renderTitle: blog title.

	pages := blog pages.
	self
		renderAllChildViewsForModels: pages atSlotNamed: #pages ;
		renderAllChildViewsForModels: pages usingPresenter: BbContentsItemPresenter atSlotNamed: #'contents-items'
]
