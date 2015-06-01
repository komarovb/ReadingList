class Book < ActiveRecord::Base
	has_many :book_genres
	has_many :genres, through: :book_genres

	has_many :user_books
	has_many :users, through: :user_books

	scope :finished, ->{where.not(finished_on:nil)}
	#scope :recent, lambda{where('finished_on > ?', 2.days.ago)}
	scope :search, ->(keyword){where('keywords LIKE ?', "%#{keyword.downcase}%") if keyword.present?}
	scope :filter, ->(title){
			joins(:genres).where('genres.name = ?',title) if title.present?}
	
	before_save :set_keywords

	def finished?
		finished_on.present?
	end
	def self.recent
		where('finished_on > ?', 2.days.ago)
	end
	#def self.search(keyword)
		#if keyword.present?
		  #where(title: keyword)
		#else
			#all
		#end
	#end
	protected
	def set_keywords
		self.keywords=[title,author,description].map(&:downcase).join(' ')
	end
end
