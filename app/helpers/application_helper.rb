module ApplicationHelper
  # ページタイトル
  def full_title(page_title = "")
    base_title = "RecipeMag - 料理を楽しむすべての人々のために"
      if page_title.empty?
        base_title
      else
        page_title + " | " + base_title
      end
  end
end
