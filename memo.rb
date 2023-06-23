require "csv" # CSVファイルを扱うためのライブラリを読み込んでいます

puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"

memo_type = gets.to_i # ユーザーの入力値を取得し、数字へ変換しています

# if文を使用して続きを作成していきましょう。
# 「memo_type」の値（1 or 2）によって処理を分岐させていきましょう。
if memo_type == 1
    puts "--新規作成--"
    puts "拡張子を除いたファイルを入力してください"
    file_name = gets.chomp
    puts "メモの内容を入力してください"
    puts "入力を完了する場合はCtrl+Dを押してください"
    new_memo = STDIN.read.chomp
    CSV.open("#{file_name}.csv","w") do |csv|
        csv << ["#{new_memo}"]
end

elsif memo_type == 2
    puts "--メモを編集--"
    puts "編集するファイルを入力してください（拡張子は除く）"
    file_name = gets.chomp
    puts "編集内容を入力してください"
    puts "入力を完了する場合はCtrl+Dを押してください"
    add_memo = STDIN.read.chomp
    CSV.open("#{file_name}.csv","a") do |csv|
        csv << ["#{add_memo}"]
end
    
else
    puts "1か2を押してください。"
end