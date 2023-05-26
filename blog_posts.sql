CREATE TABLE blog_posts (
  id SERIAL PRIMARY KEY,
  title text,
  contents text
);

-- Then the table with the foreign key first.
CREATE TABLE comments (
  id SERIAL PRIMARY KEY,
  author text,
  contents text,
-- The foreign key name is always {other_table_singular}_id
  blog_post_id int,
  constraint fk_blog_post foreign key(blog_post_id)
    references blog_posts(id)
    on delete cascade
);
