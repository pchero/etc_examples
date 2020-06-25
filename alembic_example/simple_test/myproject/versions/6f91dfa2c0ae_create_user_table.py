"""create user table

Revision ID: 6f91dfa2c0ae
Revises: 
Create Date: 2020-06-25 23:53:22.399239

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '6f91dfa2c0ae'
down_revision = None
branch_labels = None
depends_on = None


def upgrade():
    op.create_table(
        'users',
        sa.Column('id', sa.Integer, primary_key=True),
        sa.Column('name', sa.String(50), nullable=False)
    )


def downgrade():
    op.drop_table('account')
