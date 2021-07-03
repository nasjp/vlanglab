import sqlite
import vweb

struct App {
	vweb.Context
pub mut:
	db sqlite.DB
}

fn main() {
	vweb.run(&App{}, 8081)
}

pub fn (mut app App) init_server() {
	db := sqlite.connect(':memory:') or { panic(err) }
	db.exec('create table `Article` (id integer primary key, title text default "", text text default "")')
	db.exec('insert into Article (title, text) values ("Hello, world!", "V is great.")')
	db.exec('insert into Article (title, text) values ("Second post.", "Hm... what should I write about?")')
	app.db = db
}

pub fn (app &App) index() vweb.Result {
	articles := app.find_all_articles()
	return $vweb.html()
}
