class Book < ApplicationRecord
  belongs_to :user
  
  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 200}
  
      def self.search(method,word)
                if method == "forward"
                        @books = Book.where("title LIKE ? OR body LIKE ?", "#{word}%", "#{word}%")
                elsif method == "backward"
                        @books = Book.where("title LIKE ? OR body LIKE ?", "%#{word}", "%#{word}")
                elsif method == "perfect"
                        @books = Book.where("title LIKE ? OR body LIKE ?", "#{word}", "#{word}")
                elsif method == "partial"
                        @books = Book.where("title LIKE ? OR body LIKE ?", "%#{word}%", "%#{word}%")
                else
                        @books = Book.all
                end
                
                
      end
end
