Class {
	#name : #BbBlog,
	#superclass : #CpModel,
	#instVars : [
		'title',
		'pages'
	],
	#category : #'CodeParadise-BlogBuilder-Model'
}

{ #category : #'instance creation' }
BbBlog class >> exampleBlog [

	"self exampleBlog"

	^ (self title: 'Example - Blog')
		addPage: ((BbPage title: 'Welcome')
			addSection: ((BbSection header: 'Let me introduce myself')
				addParagraph: ((BbParagraph header: 'BlogBuilder')
					addContent: (BbTextContent text: 'I am a blog builder as my name suggests. You can create blogs using Smalltalk code and snapshot it to become a standalone application.') ;
					yourself) ;
				addParagraph: (BbParagraph new
					addContent: (BbTextContent text: 'The standalone application is a so called Single Page Application (SPA). The application can be distributed with very little resources. Only the SqueakJS VM, the snapshotted image and a startup index.html are needed. The first and last could be combined into a single file, by embedding the VM in the index.html file. And if you really want to go the extra mile, you can even combine all three files into a single file. The snapshot image should then be stored encoded in the index.html.') ;
					yourself) ;
				yourself) ;
			yourself) ;
		addPage: ((BbPage title: 'Second page')
			addSection: ((BbSection header: 'First section')
				addParagraph: ((BbParagraph header: 'Installing the BlogBuilder')
					addContent: (BbTextContent text: 'To install the BlogBuilder code, create a ') ;
					addContent: (BbLinkContent text: 'CodeParadise' url: 'https://github.com/ErikOnBike/CodeParadise') ;
					addContent: (BbTextContent text: ' image and then load the ') ;
					addContent: (BbLinkContent text: 'BlogBuilder' url: 'https://github.com/ErikOnBike/CodeParadise-BlogBuilder') ;
					addContent: (BbTextContent text: ' repo.') ;
					yourself) ;
				addParagraph: (BbParagraph new
					addContent: (BbTextContent text: 'Installing the BlogBuilder (as can be installed using the following snippet, inside a CodeParadise image).') ;
					addContent: (BbCodeContent code: 'Metacello new
  repository: ''github://ErikOnBike/CodeParadise-BlogBuilder:main'';
  baseline: ''CpBlogBuilder'';
  load.' language: 'Smalltalk') ;
					yourself) ;
				addParagraph: ((BbParagraph header: 'Second paragraph')
					addContent: (BbTextContent text: 'Ut hendrerit sagittis arcu in bibendum.Quisque et cursus quam. In cursus ante vitae eratProin et hendrerit dui. Sed aliquam finibus sodales. Etiam at risus sit amet nuncClass aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptosIn cursus ante vitae erat blandit, a aliquet risus mattis. Class aptent tacitiNulla facilisis, nisi sed tincidunt maximus, turpis ligula dignissim lorem, atSed venenatis feugiat fringilla. Proin et hendrerit dui. Sed aliquam finibus sodales. Etiam atVestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubiliaNulla facilisis, nisi sed tincidunt maximus, turpis ligula dignissim lorem,Pellentesque elit enim, lacinia atNunc quis hendrerit dolor. Pellentesque elit enim, lacinia at tellus eget, lacinia dapibus neque.Praesent non facilisis libero. Vestibulum ante ipsum primisNunc quis hendrerit dolor. Pellentesque elit enim, laciniaPhasellus tempus in magna ut aliquet.') ;
					addContent: (BbImageContent src: 'https://avatars.githubusercontent.com/u/5963296?v=4' title: 'An example image') ;
					addContent: (BbTextContent text: 'Suspendisse vitae dolor at velit eleifend laoreet. Nulla a turpisSed venenatis feugiat fringilla. Proin et hendrerit dui. Sed aliquam finibusDonec sollicitudin, mi in ultrices tincidunt, nisl libero gravidaPraesent non facilisis libero. Vestibulum ante ipsum primis in faucibus orci luctus et ultricesCras faucibus enim a mi dignissim, non dignissimVestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae;Sed venenatis feugiat fringilla. Proin etCras faucibus enim a mi dignissim, non dignissim lacusNulla facilisis, nisi sed tincidunt maximus, turpis ligula dignissimCras faucibus enim a mi dignissim, non dignissim lacus vehicula. Sed bibendum tortor necSed venenatis feugiat fringilla. Proin et hendrerit dui. Sed aliquam finibusQuisque et cursus quam. In cursus ante vitaeSed venenatis feugiat fringilla. Proin et hendrerit dui. Sed aliquam finibusCum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus.') ;
					yourself) ;
				addParagraph: ((BbParagraph header: 'Third paragraph')
					addContent: (BbTextContent text: 'Morbi consequat gravida ligula, ut lacinia tortorSed venenatis feugiat fringilla. ProinNulla facilisis, nisi sed tincidunt maximus, turpis ligula dignissim lorem, at laciniaSed venenatis feugiat fringilla. ProinNunc quis hendrerit dolor. Pellentesque elit enim, lacinia atNulla facilisis, nisi sed tincidunt maximus, turpis ligula dignissim lorem, at lacinia metus orciDuis condimentum dui non metusNulla facilisis, nisi sed tincidunt maximus, turpis ligula dignissim lorem, at lacinia metusMaecenas tellus sem, laoreet id auctor non,Sed venenatis feugiat fringilla. Proin et hendrerit dui. Sed aliquamMaecenas tellus sem, laoreet id auctor non, vulputate quis sem. Aenean sagittis condimentum arcu.') ;
					yourself) ;
				yourself) ;
			yourself) ;
		addPage: ((BbPage title: 'Most recent page')
			addSection: ((BbSection header: 'Final')
				addParagraph: ((BbParagraph header: 'Last words')
					addContent: (BbTextContent text: 'This is the final piece of content for this example. More examples will follow in the future. So stay tuned and happy coding!') ;
					addContent: ((BbImageContent src: 'https://www.geekytees.co.uk/wp-content/uploads/2020/05/IT-WORKS-ON-MY-MACHINE-thumb.jpg' title: 'Happy Coding')
						width: '75%' ;
						yourself) ;
				yourself) ;
			yourself) ;
		yourself) ;
	yourself
]

{ #category : #'instance creation' }
BbBlog class >> title: aString [

	^ self basicNew
		initializeWithTitle: aString ;
		yourself
]

{ #category : #accessing }
BbBlog >> addPage: aPage [

	pages add: aPage.

	self valueChanged.

	^ aPage
]

{ #category : #accessing }
BbBlog >> addPages: aCollection [

	pages addAll: aCollection.

	self valueChanged.

	^ aCollection
]

{ #category : #initialization }
BbBlog >> initialize [

	super initialize.

	pages := OrderedCollection new
]

{ #category : #initialization }
BbBlog >> initializeWithTitle: aString [

	self initialize.

	title := aString
]

{ #category : #accessing }
BbBlog >> pages [

	^ pages
]

{ #category : #presenter }
BbBlog >> preferredPresenterClass [

	^ BbBlogPresenter
]

{ #category : #accessing }
BbBlog >> title [

	^ title
]
