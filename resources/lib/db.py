import psycopg2

conn = psycopg2.connect(host='pgdb', database='ninjaplus', user='postgres', password='qaninja')

def remove_movie_by_title(title):
    sql = "DELETE FROM public.movies WHERE title = '{}';".format(title)
    cur = conn.cursor()
    cur.execute(sql)
    conn.commit()
    cur.close()
    # conn.close()

def remove_user_by_email(email):
    sql = "DELETE FROM public.users WHERE email = '{}';".format(email)
    cur = conn.cursor()
    cur.execute(sql)
    conn.commit()
    cur.close()
    # conn.close()