class Histogram < ApplicationRecord

  def to_obj
    split_corpus = self.corpus.gsub( /\W^'/, " " ).split
    result = {}
    split_corpus.each_with_index do | word, index |
      bigram = [ split_corpus[ index ], split_corpus[ index + 1 ] ].join( " " )
      unless result[ bigram ].nil?
        result[ bigram ] += 1
      else
        result[ bigram ] = 1
      end
    end
    result.sort_by{ | bigram, count | count }.reverse!
  end

end
